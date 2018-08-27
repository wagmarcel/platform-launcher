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
    var switchOffCmdName = "switch-off-srt";

    var imap_username = process.env.IMAP_USERNAME;
    var imap_password = process.env.IMAP_PASSWORD; 
    var imap_host     = process.env.IMAP_HOST;
    var imap_port     = process.env.IMAP_PORT;

    var recipientEmail = imap_username; 

    var rules = [];
    rules[switchOnCmdName] = {
	name: "oisp-tests-rule-statistic-2stddef",
	conditionComponent: componentName,
	statisticConditionOperator: ">=",
	statisticConditionValue: "2", //2*stddev
	statisticMinimalInstances: 9,
	statisticSecondsBack: 60, //number of seconds to look back when collecting the data
	actions: [
            {
                type: "actuation",
                target: [ switchOnCmdName ]
            }
        ],
    };

    rules[switchOffCmdName] = {
	name: "oisp-tests-rule-statistic-3stddef",
	conditionComponent: componentName,
	statisticConditionOperator: "<",
	statisticConditionValue: "-3", //-3*stddev
	statisticMinimalInstances: 9,
	statisticSecondsBack: 60, //number of seconds to look back when collecting the relevant data
	actions: [
            {
                type: "actuation",
                target: [ switchOffCmdName ]
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
	    expectedActuation: 1 // switch on
	},
	{
	    value: 14.5,
	    expectedActuation: 0 //switch off
	}
    ];



    var checkObservations = function(tempValues, cid){
	return new Promise((resolve, reject) => {
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
		    resolve();
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
			reject(new Error("Param value wrong. Expected: " + expectedActuationValue + " Received: " + paramValue));
		    }
		}
		else
		{
		    reject(new Error("Did not find component param: " + componentParamName));
		}
	    }
	    cbManager.set(actuationCallback);

	    var sendObservationAndCheckRules = function(index) {
		process.stdout.write(".".green);
		helpers.devices.submitData(tempValues[index].value, deviceToken, accountId, deviceId, cid, function(err, ts) {
		    tempValues[index].ts = ts;
		    
		    if (index == 0) {
			firstObservationTime = tempValues[index].ts;
		    }
		    if (err) {
			reject(err);
		    }
		    
		    if (tempValues[index].expectedActuation == null) {
			step();
		    }
		});
	    }
	    sendObservationAndCheckRules(index);
	})
    }			  
    
    var addComponent = () => {
	return new Promise(function(resolve, reject){
	    helpers.devices.addDeviceComponent(componentName, componentType, deviceToken, accountId, deviceId, function(err, id) {
		if (err) {
		    reject(err);
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
		    reject(err);
		} else {
		    resolve(id);
		}
	    })
	})
    }
    var createCommand = (cmdName, onOff) => {
	return new Promise(function(resolve, reject){
	    helpers.control.saveComplexCommand(cmdName, componentParamName, onOff, userToken, accountId, deviceId, actuatorId, function(err,response) {
		if (err) {
		    reject(err);
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
		    reject(err);
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
	"createStatisticsRules": function(done) {
	    //To be independent of main tests, own sensors, actuators, and commands have to be created
	    addComponent()
		.then((id) => {componentId = id; rules[switchOffCmdName].cid = componentId; rules[switchOnCmdName].cid = componentId;})
		.then(()   => addActuator())
		.then((id) => {actuatorId = id})
		.then(()   => createCommand(switchOffCmdName, 0))
		.then(()   => createCommand(switchOnCmdName, 1))
		.then(()   => createStatisticRule(rules[switchOffCmdName]))
		.then(()   => createStatisticRule(rules[switchOnCmdName]))
		.then(()   => {done()})
		.catch((err) => {done(err)});
	},
	"sendObservations": function(done){
	    assert.notEqual(componentId, null, "CommponentId not defined");
	    assert.notEqual(rules[switchOnCmdName].id, null, "Rule not defined");
	    assert.notEqual(rules[switchOffCmdName].id, null, "Rule not defined");
	    assert.notEqual(cbManager, null, "cbManager proxy not defined");
	    assert.notEqual(deviceToken, null, "Device Token not defined");
	    assert.notEqual(deviceId, null, "DeviceId not defined");

	    checkObservations(temperatureValues, rules[switchOnCmdName].cid)
		.then(() => {done()})
		.catch((err) => { done(err)})
	},
	"test3xStdDevRule": function(done){
	    //Delete 2xstddev rule and create 3xstddev rule
	    //send observations + 1 and trigger new actuation
	    var deleteRule = (id) => {
		return new Promise((resolve, reject) => {
		    helpers.rules.deleteRule (userToken, accountId, id, function(err, response){
			if (err) {
			    reject(err);
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
		.then(() => createStatisticRule(rule2))
		.then(() => {rule2.cid = rule.cid})
		.then(() => checkObservations(temperatureValues2, rule2.cid))
		.then(() => {done()})
		.catch( (err) => { done(err)});
	},
	"checkAlert": function(done){
	    var getAllAlerts = new Promise(function(resolve, reject){
		helpers.alerts.getListOfAlerts(userToken, accountId, function(err, response) {
		    if (err) {
			reject(err);
		    } else {
			resolve(response);
		    }
		})
	    })
	    getAllAlerts
		.then((response) => {
		    if(response[0].naturalLangAlert.indexOf(componentName) == -1) {
			done(new Error("Description of event does not contain correct component name"));
		    }
		    done();
		})
		.catch((err) => {done(err)});
	},
    }
}
var descriptions = {
    "createStatisticsRules": "Shall create statisics rules and wait for synchronization with RE",
    "sendObservations": "Shall send observations and trigger event for statistics rules",
    "test3xStdDevRule": "Shall send observations and trigger event for 3xstddev rule", 
    "checkAlert": "Check whether Alert contains the right component"
}

module.exports = {
    test: test,
    descriptions: descriptions
}
