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
  var componentNames = ["temperature-sensor-st", "humidity-sensor-st", "metadata-sensor-st", "binarystate-senosr-st", "binarydata-sensor-st"];
  var componentTypes = ["temperature.v1.0", "humidity.v1.0", "metaData.v1.0", "binaryState.v1.0", "images.v1.0"];
  var componentBasicTypes = ["number", "number", "string", "boolean", "bytearray"];
  var aggregateable = [1, 1, 0, 0, 0];
  var componentMapping = {};
  var promtests = require('./promise-wrap');
  var uuidv4 = require('uuid/v4');
  var rules = [];
  var componentIds = [];
  var dataValues1Time;
  var dataValues2Time;
  var dataValues3Time;
  var dataValues4Time;
  var dataValues5StartTime;
  var dataValues5StopTime;
  var dataValues6StartTime;
  var dataValues6StopTime;
  var accountId2;
  var accountName2 = "badAccount";
  var userToken2;
  var username2 = process.env.USERNAME2;
  var password2 = process.env.PASSWORD2;
  var newDeviceId = "scaleDevice";
  var newDeviceNumber = 100;
  var newComponentId;
  const MIN_NUMBER = 0.0001;
  const MAX_SAMPLES = 1000;
  const BASE_TIMESTAMP = 1000000000000


  function random(max) {
    return Math.floor(Math.random() * max);
  }

  var dataValues = [
    {
       component: 0,
       value: 10,
       ts: 1 + BASE_TIMESTAMP
    },
    {
       component: 1,
       value: 12,
       ts: 1 + BASE_TIMESTAMP
    },
    {
       component: 2,
       value: "Hello World",
       ts: 1 + BASE_TIMESTAMP
    },
    {
       component: 3,
       value: 1,
       ts: 1 + BASE_TIMESTAMP
    },
    {
       component: 4,
       value: Buffer.from("Hello World!"),
       ts: 1 + BASE_TIMESTAMP
    }
  ]
  //********************* Main Object *****************//
  //---------------------------------------------------//
  return {
    "setup": function(done) {
      var promises = Array.apply(0, Array(newDeviceNumber)).map((item, index) => {
        return promtests.createDevice(newDeviceId + index, newDeviceId + index, userToken, accountId)
          .then(() => promtests.activateDevice(userToken, accountId, newDeviceId + index))
          .then(() => promtests.addComponent(componentNames[index % 5], componentTypes[index % 5], userToken, accountId, newDeviceId + index))
          .then(id => {componentIds[index] = []; componentIds[index][0] = id; return})
          .then(() => {
            var randComp = random(5);
            if (randComp == index % 5) {
              randComp += 1;
              randComp = randComp % 5;
            }
            componentMapping[newDeviceId + index] = randComp; //save the random component for later to determine data type
            return promtests.addComponent(componentNames[randComp], componentTypes[randComp], userToken, accountId, newDeviceId + index)
          })
          .then(id => {componentIds[index][1] = id; return})
          .catch((err) => {
              done(err);
            })
      });

      Promise.all(promises)
      .then(() => done())
      .catch((err) => {
          done(err);
        });
    },
    "sendDataToAllDevicesAndCount": function(done) {
      var promises = Array.apply(0, Array(newDeviceNumber)).map((item, index) => {
        var valueList = [];
        valueList[0] = dataValues[index % 5];
        valueList[1] = dataValues[componentMapping[newDeviceId + index]];
        valueList[0].ts += index * 100000;
        valueList[0].component = 0;
        valueList[1].ts += index * 100000;
        valueList[1].component = 1;
        var cidList = componentIds[index];
        return promtests.submitDataListAsUser(valueList, userToken, accountId, newDeviceId + index, cidList);
      })
      Promise.all(promises)
      .then(() => done())
      .catch((err) => {
          done(err);
        });
    },
    "cleanup": function(done) {
      promtests.deleteComponent(userToken, accountId, deviceId, componentId[0])
        .then(() => promtests.deleteComponent(userToken, accountId, deviceId, componentId[1]))
        .then(() => promtests.deleteComponent(userToken, accountId, newDeviceId, newComponentId))
        .then(() => promtests.deleteDevice(userToken, accountId, newDeviceId))
        .then(() => promtests.deleteAccount(userToken2, accountId2))
        .then(() => promtests.deleteInvite(userToken, accountId, username2))
        .then(() => { done() })
        .catch((err) => {
          done(err);
        });
    }
  };
};

var descriptions = {
  "setup": "Shall setup needed devices and components",
  "sendDataToAllDevicesAndCount": "Send Data to all devices and count all",
  "cleanup": "Cleanup components, commands, rules created for subtest"
};

module.exports = {
  test: test,
  descriptions: descriptions
};
