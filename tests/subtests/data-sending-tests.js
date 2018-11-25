/**
 * Copyright (c) 2018 Intel Corporation
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
/*jshint esversion: 6 */
/*jshint undef: true, unused: true */
/* jshint node: true */

"use strict";

var test = function(userToken, accountId, deviceId, deviceToken, cbManager) {
    var chai = require('chai');
    var assert = chai.assert;
    var helpers = require("../lib/helpers");
    var componentNames = ["temperature-sensor-sdt", "humidity-sensor-sdt"];
    var componentTypes = ["temperature.v1.0", "humidity.v1.0"];
    var promtests = require('./promise-wrap');
    var rules = [];
    var componentId = [];
    var dataValues1Time;

    var dataValues1 = [
	[
	    {
		component: 0,
		value: 10.1,
		ts: 1
	    }
	],
	[
	    {
		component: 0,
		value: 11.2,
		ts: 2
	    },
	    {
		component: 0,
		value: 12.3,
		ts: 3
	    }
	],
	[
	    {
		component: 0,
		value: 13.4,
		ts: 4
	    },
	    {
		component: 0,
		value: 14.5,
		ts: 5
	    },
	    {
		component: 0,
		value: 15.6,
		ts: 6
	    }
	],
	[
	    {
		component: 0,
		value: 16.7,
		ts: 7
	    },
	    {
		component: 0,
		value: 17.8,
		ts: 8
	    },
	    {
		component: 0,
		value: 18.9,
		ts: 9
	    },
	    {
		component: 0,
		value: 20.0,
		ts: 10
	    }
	],
	[
	    {
		component: 0,
		value: 21.1,
		ts: 11
	    },
	    {
		component: 0,
		value: 22.2,
		ts: 12
	    },
	    {
		component: 0,
		value: 23.3,
		ts: 13
	    },
	    {
		component: 0,
		value: 24.4, ts: 14
	    },
	    {
		component: 0,
		value: 25.5,
		ts: 15
	    }
	    
	]
    ];

    

    var comparePoints = function(dataValues, points){
	var result = true;
	var reason = "";
	points.forEach(function(element, index){
	    if ((element.ts != dataValues[index].ts) ||
		(element.value != dataValues[index].value)){
		result = false;
		reason = "Point " + JSON.stringify(element) + " does not fit to expected value " +
		    JSON.stringify({ ts: dataValues[index].ts, value: dataValues[index].value});
	    }
	});
	if (result) return true;
	else return reason;
    }
    //********************* Main Object *****************//
    //---------------------------------------------------//
    return {
	"sendAggregatedDataPoints": function(done) {
	    //To be independent of main tests, own sensors, actuators, and commands have to be created
	    promtests.addComponent(componentNames[0], componentTypes[0], deviceToken, accountId, deviceId)
		.then((id) => {componentId[0] = id;})
		.then((id) => promtests.addComponent(componentNames[1], componentTypes[1], deviceToken, accountId, deviceId))
	    	.then((id) => {componentId[1] = id;})
		.then(() => {
		    var proms = [];
		    dataValues1Time = 0;
		    dataValues1.forEach(function(element){
			proms.push(promtests.submitDataList(element, deviceToken, accountId, deviceId, componentId))
		    });
		    return Promise.all(proms);
		})
		.then(()   => {done();})
		.catch((err) => {done(err);});
	},
	"receiveAggregatedDataPoints": function(done){
	    var listOfExpectedResults = dataValues1.map(function(element) {
		return element;
	    });
	    listOfExpectedResults = listOfExpectedResults.reduce(function(acc, cur) {
		return acc.concat(cur)
	    })
	    promtests.searchData(dataValues1Time, deviceToken, accountId, deviceId, componentId[0])
		//.then((result) => console.log("Result", JSON.stringify(result)))
		.then((result) => {
		    var comparisonResult = comparePoints(listOfExpectedResults, result);
		    if (comparisonResult === true) {
			done();
		    }
		    else {
			done(comparisonResult);
		    }
		})
		.catch((err) => {done(err);});
	    
	},
	"sendAggregatedMultipleDataPoints": function(done){
	}
    };
};

var descriptions = {
    "sendAggregatedDataPoints": "Shall send multiple datapoints for one component",
    "receiveAggregatedDataPoints": "Shall receive multiple datapoints for one component",
    "sendAggregatedMultipleDataPoints": "Shall send multiple datapoints for 2 components",
    "cleanup": "Cleanup components, commands, rules created for subtest"
};

module.exports = {
    test: test,
    descriptions: descriptions
};
