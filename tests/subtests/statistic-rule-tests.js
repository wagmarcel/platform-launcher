/**
 * Copyright (c) 2017 Intel Corporation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
"use strict";

var test = function(userToken, accountId, deviceId, deviceToken, cbManager) {
    var chai = require('chai');
    var assert = chai.assert;
    var expect = chai.expect;

    var config = require("../test-config.json");
    var oispSdk = require("@open-iot-service-platform/oisp-sdk-js");
    //var proxyConnector = oispSdk(config).lib.proxies.getControlConnector('ws');
    var kafka = require('kafka-node');
    var cfenvReader = require('../lib/cfenv/reader');
    var helpers = require("../lib/helpers");
    var colors = require('colors');

    var exec = require('child_process').exec;

    var accountName = "oisp-tests";
    var deviceName = "oisp-tests-device";

    var componentName = "temperature-sensor-srt";
    var componentType = "temperature.v1.0";

    var actuatorName = "powerswitch-actuator-srt";
    var actuatorType = "powerswitch.v1.0";

    var switchOnCmdName = "switch-on-srt";


    var emailRecipient = "test.receiver@streammyiot.com"

    var imap_username = process.env.IMAP_USERNAME;
    var imap_password = process.env.IMAP_PASSWORD; 
    var imap_host     = process.env.IMAP_HOST;
    var imap_port     = process.env.IMAP_PORT;

    var recipientEmail = imap_username; 


    var rule = {
	name: "oisp-tests-rule-statistic-2stddef",
	conditionComponent: componentName,
	statisticConditionOperator: ">=",
	statisticConditionValue: "2",
	statisticMinimalInstances: 9,
	statisticSecondsBack: 1,
	actions: [
            {
                type: "actuation",
                target: [ switchOnCmdName ]
            }
        ],
    };

     var rule2 = {
	name: "oisp-tests-rule-statistic-3stddef",
	conditionComponent: componentName,
	statisticConditionOperator: ">=",
	statisticConditionValue: "3",
	statisticMinimalInstances: 9,
	statisticSecondsBack: 1,
	actions: [
            {
                type: "actuation",
                target: [ switchOnCmdName ]
            }
        ],
    };


    //-------------------------------------------------------------------------------------------------------
    // Tests
    //-------------------------------------------------------------------------------------------------------
    var receiverToken;
    var receiveruserId;
    var receiveraccountId;
    var userId; 
    //var deviceToken;
    var componentId;
    var actuatorId;
    var rulelist;
    var alertlist;               
    var componentParamName = "LED"; 
    var firstObservationTime;

    var temperatureValues = [
	{
            value: 17.1,
            expectedActuation: null
	},
	{
	    value: 17.0,
	    expectedActuation: null,
	},
	{
	    value: 17.9,
	    expectedActuation: null,
	},
	{
	    value: 17.5,
	    expectedActuation: null,
	},
	{
	    value: 18.1,
	    expectedActuation: null,
	},
	{
	    value: 16.8,
	    expectedActuation: null,
	},
	{
	    value: 17.3,
	    expectedActuation: null,
	},
	{
	    value: 16.9,
	    expectedActuation: null
	},
	{
	    value: 17,
	    expectedActuation: null,
	},
	{
	    value: 18.6,
	    expectedActuation: 1, // swich on
	}
    ];

        var temperatureValues2 = [
	{
            value: 17.1,
            expectedActuation: null
	},
	{
	    value: 17.0,
	    expectedActuation: null,
	},
	{
	    value: 17.9,
	    expectedActuation: null,
	},
	{
	    value: 17.5,
	    expectedActuation: null,
	},
	{
	    value: 18.1,
	    expectedActuation: null,
	},
	{
	    value: 16.8,
	    expectedActuation: null,
	},
	{
	    value: 17.3,
	    expectedActuation: null,
	},
	{
	    value: 16.9,
	    expectedActuation: null
	},
	{
	    value: 17,
	    expectedActuation: null,
	},
	{
	    value: 18.6,
	    expectedActuation: null
	},
	    {
		value: 20.0,
		expectedActuation: null
	    }
    ];

    var checkObservations = function(done, tempValues){
	var index = 0;
	var nbActuations = 0;

	process.stdout.write("    ");

	tempValues
	    .forEach( (value) => {
		value.ts = null;
		if (value.expectedActuation != null) {
		    nbActuations++;
		}
	    });
	var step = function(){
	    index++;
	    
	    if (index == tempValues.length) {
		process.stdout.write("\n");
		done();
	    } else {
		sendObservationAndCheckRules(index);
	    }
	};

	var actuationCallback = function(message) {
	    --nbActuations;
	    var expectedActuationValue = tempValues[index].expectedActuation.toString();
	    var componentParam = message.content.params.filter(function(param){
		return param.name == componentParamName;
	    });
	    
	    if(componentParam.length == 1)
	    {
		var param = componentParam[0];
		var paramValue = param.value.toString();
		
		if(paramValue == expectedActuationValue)
		{
		    step();
		}
		else
		{
		    done(new Error("Param value wrong. Expected: " + expectedActuationValue + " Received: " + paramValue));
		}
	    }
	    else
	    {
		done(new Error("Did not find component param: " + componentParamName))
	    }
	}
	cbManager.set(actuationCallback);

	var sendObservationAndCheckRules = function(index) {

	    process.stdout.write(".".green);
	    
	    helpers.devices.submitData(tempValues[index].value, deviceToken, accountId, deviceId, componentId, function(err, ts) {
		tempValues[index].ts = ts;
		
		if (index == 0) {
		    firstObservationTime = tempValues[index].ts;
		}
		if (err) {
		    done( "Cannot send observation: " + err);
		}
		
		if (tempValues[index].expectedActuation == null) {
		    step();
		}
	    });
	}
	sendObservationAndCheckRules(index);
    }
    
    var addComponent = () => {
	return new Promise(function(resolve, reject){
	    helpers.devices.addDeviceComponent(componentName, componentType, deviceToken, accountId, deviceId, function(err, id) {
		if (err) {
		    reject("Cannot create component: " + err);
		} else {
		    resolve(id);
		}
	    });
	});
    }
    var addActuator = () => {
	return new Promise(function(resolve, reject){
	    helpers.devices.addDeviceComponent(actuatorName, actuatorType, deviceToken, accountId, deviceId, function(err, id) {
		if (err) {
		    reject("Cannot create actuator: " + err);
		} else {
		    resolve(id);;
		}
	    })
	})
    }
    var createCommand = () => {
	return new Promise(function(resolve, reject){
	    helpers.control.saveComplexCommand(switchOnCmdName, componentParamName, 1, userToken, accountId, deviceId, actuatorId, function(err,response) {
		if (err) {
		    reject("Cannot create switch-on command: " + err);
		} else {
		    assert.equal(response.status, 'OK', 'get error response status')
		    resolve();
		}
	    })
	})
    }
    var createStatisticRule = (rule) => {
	return new Promise(function(resolve, reject){
	    helpers.rules.createStatisticRule(rule, userToken, accountId, deviceId, function(err, id) {
		if (err) {
		    reject("Cannot create switch-on rule: " + err);
		} else {
		    rule.id = id;
		    resolve();
		}
	    })
	})
    }

    //********************* Main Object *****************//
    //---------------------------------------------------//
    return {
	"createStatisticsRule": function(done) {
	    //To be independent of main tests, own sensors, actuators, and commands have to be created

	    addComponent()
		.then((id) => {componentId = id; rule.cid = componentId;})
		.then(()   => addActuator())
		.then((id) => {actuatorId = id;})
		.then(()   => createCommand())
		.then(()   => createStatisticRule(rule))
		.then(()   => {done()})
		.catch( (err) => { done(new Error("Error in creating statistics rule: ", err))});
	},
	"sendObservations": function(done){
	    assert.notEqual(componentId, null, "CommponentId not defined");
	    assert.notEqual(rule.id, null, "Rule not defined");
	    assert.notEqual(cbManager, null, "cbManager proxy not defined");
	    assert.notEqual(deviceToken, null, "Device Token not defined");
	    assert.notEqual(deviceId, null, "DeviceId not defined");

	    checkObservations(done, temperatureValues);
	},
	"test3xStdDevRule": function(done){
	    //Delete 2xstddev rule and create 3xstddev rule
	    //send observations + 1 and trigger new actuation
	    var deleteRule = (id) => {
		return new Promise((resolve, reject) => {
		    helpers.rules.deleteRule (userToken, accountId, id, function(err, response){
			if (err) {
			    reject("cannot delete a rule " + err);
			} else {
			    assert.notEqual(response, null ,'response is null');
			    assert.equal(response.status, 'Done');
			    resolve();
			}
		    })
		})
	    }
	    rule2.cid = componentId;
	    deleteRule(rule.id)
		.then(createStatisticRule(rule2))
		.then (done())
		.catch( (err) => { done(new Error("Error in testing 3xStdDevRule: ", err))});
	},
	"checkAlert": function(done){
	    var getAllAlerts = new Promise(function(resolve, reject){
		helpers.alerts.getListOfAlerts(userToken, accountId, function(err, response) {
		    if (err) {
			reject("Cannot get list of alerts: " + err);
		    } else {
			resolve(response);
		    }
		})
	    })
	    getAllAlerts
		.then((response) => {
		    if(response[0].naturalLangAlert.indexOf(componentName) == -1) {
			reject("Description of event does not containt correct component name");
		    }
		    done();
		})
		.catch( (err) => { done(new Error("Error in alerts: ", err))});
	},
    }
}
var descriptions = {
    "createStatisticsRule": "Shall create statisics rule and wait for synchronization with RE",
    "sendObservations": "Shall send observations and trigger event for 2xstddev rule",
    "test3xStdDevRule": "Shall send observations and trigger event for 3xstddev rule", 
    "checkAlert": "Check whether Alert contains the right component"
}

module.exports = {
    test: test,
    descriptions: descriptions
}
