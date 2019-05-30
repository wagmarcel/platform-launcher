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

var test = function(userToken, accountId, deviceId, deviceToken, cbManager, mqttConnector) {
  var chai = require('chai');
  var assert = chai.assert;
  var helpers = require("../lib/helpers");
  var componentNames = ["temperature-sensor-mqtt", "humidity-sensor-mqtt"];
  var componentTypes = ["temperature.v1.0", "humidity.v1.0"];
  var promtests = require('./promise-wrap');
  var uuidv4 = require('uuid/v4');
  var rules = [];
  var componentId = [];
  var dataValues1Time;
  var dataValues2Time;
  var dataValues3Time;
  var dataValues4Time;
  var dataValues5StartTime;
  var dataValues5StopTime;
  var dataValues6StartTime;
  var dataValues6StopTime;
  var accountId2;
  var accountName2 = "badAccount-mqtt";
  var userToken2;
  var username2 = process.env.USERNAME2;
  var password2 = process.env.PASSWORD2;
  var newDeviceId = "d-e-v-i-c-e-mqtt";
  var newDeviceName ="devicename-mqtt"
  var newComponentId;
  var mqttCon = mqttConnector; 
  const MIN_NUMBER = 0.0001;
  const MAX_SAMPLES = 1000;
  const BASE_TIMESTAMP = 1000000000000

  var dataValues1 = [
    [{
      component: 0,
      value: 10.2,
      ts: 1 + BASE_TIMESTAMP
    }],
    [{
      component: 0,
      value: 12.2,
      ts: 2 + BASE_TIMESTAMP
    }, {
      component: 0,
      value: 13.3,
      ts: 3 + BASE_TIMESTAMP
    }],
    [{
      component: 0,
      value: 13.7,
      ts: 4 + BASE_TIMESTAMP
    },
    {
      component: 0,
      value: 12.6,
      ts: 5 + BASE_TIMESTAMP
    },
    {
      component: 0,
      value: 15.6,
      ts: 6 + BASE_TIMESTAMP
    }
    ],
    [{
      component: 0,
      value: 16.7,
      ts: 7 + BASE_TIMESTAMP
    },
    {
      component: 0,
      value: 17.8,
      ts: 8 + BASE_TIMESTAMP
    },
    {
      component: 0,
      value: 18.9,
      ts: 9 + BASE_TIMESTAMP
    },
    {
      component: 0,
      value: 20.0,
      ts: 10 + BASE_TIMESTAMP
    }
    ],
    [{
      component: 0,
      value: 21.1,
      ts: 11 + BASE_TIMESTAMP
    },
    {
      component: 0,
      value: 22.2,
      ts: 12 + BASE_TIMESTAMP
    },
    {
      component: 0,
      value: 23.3,
      ts: 13 + BASE_TIMESTAMP
    },
    {
      component: 0,
      value: 24.4,
      ts: 14 + BASE_TIMESTAMP
    },
    {
      component: 0,
      value: 25.5,
      ts: 15 + BASE_TIMESTAMP
    }

    ]
  ];

  //********************* Main Object *****************//
  //---------------------------------------------------//
  return {
    "setup": function(done) {
      var username = process.env.USERNAME;
      var password = process.env.PASSWORD;
      
      promtests.authGetToken(username, password)
      .then((userToken) => promtests.createDevice(newDeviceName, newDeviceId, userToken, accountId))
      .then(() => promtests.activateDevice(userToken, accountId, newDeviceId))
      .then((token) => {
        deviceToken = token.deviceToken;
      })
      .then(() => 
      promtests.addComponent(componentNames[0], componentTypes[0], 
        userToken, accountId, newDeviceId))
      .then((id) => {componentId[0] = id;})
      .then(() => promtests.addComponent(componentNames[1], componentTypes[1],
        userToken, accountId, newDeviceId))
      .then((id) => {componentId[1] = id;})
      .then(() => done())
      .catch((err) => {done(err);});
    },
    "sendAggregatedDataPoints": function(done) {
      //To be independent of main tests, own sensors, actuators, and commands have to be created
      promtests.mqttSetCredential(mqttCon, deviceToken, newDeviceId)
      .then(() => promtests.mqttSubmitData(mqttCon, dataValues1[0], deviceToken, accountId, 
        newDeviceId, componentId[0]))
      .then(() => { done();})
      .catch((err) => {done(err);});
    },
    "cleanup": function(done) {
      promtests.deleteComponent(userToken, accountId, newDeviceId, componentId[0])
      .then(() => promtests.deleteComponent(userToken, accountId, newDeviceId, componentId[1]))
      .then(() => promtests.deleteDevice(userToken, accountId, newDeviceId))
      .then(() => {done() })
      .catch((err) => {done(err);});
    }
  }
};
var descriptions = {
  "setup": "Setup device and components for subtest",
  "sendAggregatedDataPoints": "Shall send multiple datapoints for one component with MQTT",
  "cleanup": "Cleanup components, commands, rules created for subtest"
};

module.exports = {
  test: test,
  descriptions: descriptions
};
