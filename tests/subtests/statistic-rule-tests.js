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

var test = function(userToken, accountId, deviceId) {
    var chai = require('chai');
    var assert = chai.assert;
    var expect = chai.expect;

    var config = require("../test-config.json");
    var oispSdk = require("@open-iot-service-platform/oisp-sdk-js");
    var proxyConnector = oispSdk(config).lib.proxies.getControlConnector('ws');
    var kafka = require('kafka-node');
    var cfenvReader = require('../lib/cfenv/reader');
    var helpers = require("../lib/helpers");
    var colors = require('colors');

    var exec = require('child_process').exec;

    var accountName = "oisp-tests";
    var deviceName = "oisp-tests-device";

    var componentName = "temperature-sensor";
    var componentType = "temperature.v1.0";

    var actuatorName = "powerswitch-actuator";
    var actuatorType = "powerswitch.v1.0";

    var switchOnCmdName = "switch-on";
    var switchOffCmdName = "switch-off";


    var emailRecipient = "test.receiver@streammyiot.com"

    var imap_username = process.env.IMAP_USERNAME;
    var imap_password = process.env.IMAP_PASSWORD; 
    var imap_host     = process.env.IMAP_HOST;
    var imap_port     = process.env.IMAP_PORT;

    var recipientEmail = imap_username; 


    var rule = {
	name: "oisp-tests-rule-statistic",
	conditionComponent: componentName,
	statisticConditionOperator: "<=",
	statisticConditionValue: "2",
	statisticMinimalInstances: 10,
	statisticSecondsBack: 10,
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
    var deviceToken;
    var componentId;
    var actuatorId;
    var rulelist;
    var alertlist;               
    var componentParamName; 
    var firstObservationTime;

    var temperatureValues = [{
        value: -15,
        expectedActuation: 1, // swich on
        expectedEmailReason: "temperature-sensor <= 15"
    },
			     {
				 value: -5,
				 expectedActuation: 1, // swich on
				 expectedEmailReason: "temperature-sensor <= 15"
			     },
			     {
				 value: 5,
				 expectedActuation: 1, // swich on
				 expectedEmailReason: "temperature-sensor <= 15"
			     },
			     {
				 value: 15,
				 expectedActuation: 1, // swich on
				 expectedEmailReason: "temperature-sensor <= 15"
			     },
			     {
				 value: 25,
				 expectedActuation: null, // do nothing (no actuation)
				 expectedEmailReason: null,
			     },
			     {
				 value: 30,
				 expectedActuation: 0, // swich off
				 expectedEmailReason: "temperature-sensor > 25"
			     },
			     {
				 value: 20,
				 expectedActuation: null, // do nothing (no actuation)
				 expectedEmailReason: null
			     },
			     {
				 value: 14,
				 expectedActuation: 1, // swich on
				 expectedEmailReason: "temperature-sensor <= 15"
			     },
			     {
				 value: 20,
				 expectedActuation: null, // do nothing (no actuation)
				 expectedEmailReason: null
			     },
			     {
				 value: 28,
				 expectedActuation: 0, // swich off
				 expectedEmailReason: "temperature-sensor > 25"
			     }
			    ];



    return {
        "createStatisticsRule": function(done) {
            rule.cid = componentId;

            helpers.rules.createStatisticRule(rule, userToken, accountId, deviceId, function(err, id) {
		if (err) {
                    done(new Error("Cannot create switch-on rule: " + err));
		} else {
                    rule.id = id;
                    done();
		}
            })

	}

	

    }
}

module.exports = {
    test: test
}
