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
  var oispSdk = require("@open-iot-service-platform/oisp-sdk-js");
  var config = require("../test-config-mqtt.json");
  var chai = require('chai');
  var assert = chai.assert;
  var helpers = require("../lib/helpers");
  var componentNames = ["temperature-sensor-sdt", "humidity-sensor-sdt"];
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
  const MIN_NUMBER = 0.0001;
  const MAX_SAMPLES = 1000;
  const BASE_TIMESTAMP = 1000000000000
  //console.log("bypassmqttsubtest0")
  //console.log("default_connector", (config.default_connector))
  // helpers.connector.mqttConnect(proxyConnector, deviceToken, deviceId, cbManager.cb);

  var dataValues1 = [
    [{
      component: 0,
      value: 10.1,
      ts: 1 + BASE_TIMESTAMP
    }],
    [{
      component: 0,
      value: 11.2,
      ts: 2 + BASE_TIMESTAMP
    }, {
      component: 0,
      value: 12.3,
      ts: 3 + BASE_TIMESTAMP
    }],
    [{
      component: 0,
      value: 13.4,
      ts: 4 + BASE_TIMESTAMP
    },
    {
      component: 0,
      value: 14.5,
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


  var dataValues2 = [
    [{
      component: 0,
      value: 10.1,
      ts: 1000 + BASE_TIMESTAMP
    }],
    [{
      component: 1,
      value: 10,
      ts: 1020 + BASE_TIMESTAMP
    },
    {
      component: 0,
      value: 12.3,
      ts: 1030 + BASE_TIMESTAMP
    }
    ],
    [{
      component: 0,
      value: 13.4,
      ts: 1040 + BASE_TIMESTAMP
    },
    {
      component: 1,
      value: 20,
      ts: 1050 + BASE_TIMESTAMP
    },
    {
      component: 0,
      value: 15.6,
      ts: 1060 + BASE_TIMESTAMP
    }
    ],
    [{
      component: 1,
      value: 30,
      ts: 1070 + BASE_TIMESTAMP
    },
    {
      component: 0,
      value: 17.8,
      ts: 1070 + BASE_TIMESTAMP
    },
    {
      component: 0,
      value: 18.9,
      ts: 1090 + BASE_TIMESTAMP
    },
    {
      component: 1,
      value: 40,
      ts: 1100 + BASE_TIMESTAMP
    }
    ],
    [{
      component: 1,
      value: 50,
      ts: 1170 + BASE_TIMESTAMP
    }]
  ]

  var dataValues3 = [
    [{
      component: 0,
      value: 10,
      ts: 10000 + BASE_TIMESTAMP,
      loc: [99.12345, 12.3456, 456.789]
    }],
    [{
      component: 0,
      value: 11,
      ts: 20000 + BASE_TIMESTAMP,
      loc: [9.8765, 432.1, 9.876]
    }],
    [{
      component: 0,
      value: 12,
      ts: 30000 + BASE_TIMESTAMP,
    }],
    [{
      component: 0,
      value: 13,
      ts: 40000 + BASE_TIMESTAMP,
      loc: [0.0, 0.0, 0.0]
    }],
    [{
      component: 0,
      value: 14,
      ts: 50000 + BASE_TIMESTAMP,
      loc: [200.345, 300.21]
    }]
  ];

  var dataValues4 = [
    [{
      component: 1,
      value: 99,
      ts: 100000 + BASE_TIMESTAMP,
      loc: [1.2444, 10.987, 456.789],
      attributes: {
        "key1": "value1"
      }
    }],
    [{
      component: 1,
      value: 98,
      ts: 200000 + BASE_TIMESTAMP,
      attributes: {
        "key1": "value1",
        "key2": "value2",
        "key3": "value3"
      }
    }],
    [{
      component: 1,
      value: 97,
      ts: 300000 + BASE_TIMESTAMP,
      attributes: {
        "key3": "value1",
        "key4": "value2"
      }
    }],
    [{
      component: 1,
      value: 96,
      ts: 400000 + BASE_TIMESTAMP,
      loc: [0.0, 0.0, 0.0]
    }],
    [{
      component: 1,
      value: 95,
      ts: 500000 + BASE_TIMESTAMP,
      loc: [200.345, 300.21],
      attributes: {
        "key5": "key1"
      }
    }]
  ];

  var dataValues5 = [
    [{
      component: 2,
      value: 10.1,
      ts: 1100000000 + BASE_TIMESTAMP
    }],
    [{
      component: 0,
      value: 10,
      ts: 1100020000 + BASE_TIMESTAMP
    },
    {
      component: 2,
      value: 12.3,
      ts: 1100030000 + BASE_TIMESTAMP
    }
    ],
    [{
      component: 0,
      value: 13.4,
      ts: 1100040000 + BASE_TIMESTAMP
    },
    {
      component: 0,
      value: 20,
      ts: 1100050000 + BASE_TIMESTAMP
    },
    {
      component: 2,
      value: 15.6,
      ts: 1100060000 + BASE_TIMESTAMP
    }]
  ];

  var dataValues6 = [
    {
      component: 0,
      value: 1,
      ts: 1200000000 + BASE_TIMESTAMP
    },
    {
      component: 0,
      value: 2,
      ts: 1200020000 + BASE_TIMESTAMP
    }
  ]

  var dataValues7 = [
    {
      component: 0,
      value: 101,
      ts: 1200000001 + BASE_TIMESTAMP
    },
    {
      component: 0,
      value: 102,
      ts: 1200020001 + BASE_TIMESTAMP
    }
  ]

  var aggregation = {
    MAX: 0,
    MIN: 1,
    COUNT: 2,
    SUM: 3,
    SUMOFSQUARES: 4
  }

  var createObjectFromData = function(sample, sampleHeader) {
    var o = {};
    sample.forEach(function(element, index) {
      if (element != "") {
        var key = sampleHeader[index];
        if (key === "Value") {
          key = "value";
        } else if (key === "Timestamp") {
          key = "ts";
        }
        o[key] = element;
      }
    })
    return o;
  }

  var locEqual = function(dataValue, element, onlyExistingAttr) {
    if (onlyExistingAttr) {
      if (element.lat === undefined && element.long === undefined) {
        return true;
      }
    }
    if (dataValue.loc == undefined) {
      if ((element.lat == undefined || element.lat === "") && (element.lat == undefined || element.lon === "") && (element.alt == undefined || element.alt === "")) {
        return true;
      } else {
        return false;
      }
    }
    if ((dataValue.loc[0] == undefined || (Math.abs(dataValue.loc[0] - Number(element.lat))) <= MIN_NUMBER)
      && (dataValue.loc[1] == undefined || (Math.abs(dataValue.loc[1].toString() - Number(element.lon))) <= MIN_NUMBER)
      && (dataValue.loc[2] == undefined || (Math.abs(dataValue.loc[2].toString() - Number(element.alt))) <= MIN_NUMBER)) {
      return true;
    } else {
      return false;
    }
  }

  var attrEqual = function(dataValue, element, onlyExistingAttr) {
    var result = true;
    if (dataValue.attributes !== undefined) {
      Object.keys(dataValue.attributes).forEach(function(el) {
        if (!onlyExistingAttr && element[el] != dataValue.attributes[el]) {
          result = false;
        } else {
          if (element[el] !== undefined && element[el] != dataValue.attributes[el]) {
            result = false;
          }
        }
      })
    }
    return result;
  }

  var comparePoints = function(dataValues, points, onlyExistingAttributes) {
    var result = true;
    var reason = "";
    var onlyExistingAttr = onlyExistingAttributes == undefined ? false : onlyExistingAttributes;
    if (points.length != dataValues.length) {
      return "Wrong number of returned points";
    }
    points.forEach(function(element, index) {
      if ((element.ts != dataValues[index].ts) ||
        ((Math.abs(element.value - dataValues[index].value)) > MIN_NUMBER) ||
        !locEqual(dataValues[index], element, onlyExistingAttr) ||
        !attrEqual(dataValues[index], element, onlyExistingAttr)) {
        result = false;
        reason = "Point " + JSON.stringify(element) + " does not fit to expected value " +
          JSON.stringify(dataValues[index]);
      }
    });
    if (result === true) return true;
    else return reason;
  }

  var flattenArray = function(array) {
    var results = array.map(function(element) {
      return element;
    });
    results = results.reduce(function(acc, cur) {
      return acc.concat(cur)
    })
    return results;
  }

  var calcAggregationsPerComponent = function(flattenedArray) {

    return flattenedArray.reduce(function(acc, val) {
      if (val.value > acc[val.component][aggregation.MAX]) {
        acc[val.component][aggregation.MAX] = val.value;
      }
      if (val.value < acc[val.component][aggregation.MIN]) {
        acc[val.component][aggregation.MIN] = val.value;
      }
      acc[val.component][aggregation.COUNT]++;
      acc[val.component][aggregation.SUM] += val.value;
      acc[val.component][aggregation.SUMOFSQUARES] += val.value * val.value;
      return acc;
    }, [[Number.MIN_VALUE, Number.MAX_VALUE, 0, 0, 0], [Number.MIN_VALUE, Number.MAX_VALUE, 0, 0, 0]])
  }

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
        deviceToken, accountId, newDeviceId))
      .then((id) => {componentId[0] = id;})
      .then(() => promtests.addComponent(componentNames[1], componentTypes[1],
        deviceToken, accountId, newDeviceId))
      .then((id) => {componentId[1] = id;})
      .then(() => done())
      .catch((err) => {done(err);});
    },

    "sendSingleDataPoint" : function(done){
      promtests.mqttSetCredential(mqttConnector, deviceToken, newDeviceId)
      .then(() => promtests.mqttSubmitData(mqttConnector, dataValues1[0], deviceToken, accountId, 
        newDeviceId, componentId[0]))
      .then(() => { done();})
      .catch((err) => {done(err);});
    },

    "waitForBackendSynchronization": function(done) {
      setTimeout(done, 2000);

    },

    "cleanup": function(done) {
      promtests.deleteComponent(userToken, accountId, newDeviceId, componentId[0])
      .then(() => promtests.deleteComponent(userToken, accountId, newDeviceId, componentId[1]))
      .then(() => promtests.deleteDevice(userToken, accountId, newDeviceId))
      .then(() => {done() })
      .catch((err) => {done(err);});
    }
  };
};

var descriptions = {
  "cleanup": "Cleanup components, commands, rules created for subtest",
  "sendAggregatedDataPoints": "Shall send multiple datapoints for one component",
  "sendSingleDataPoint": "Send a single data point",
  "waitForBackendSynchronization": "Waiting maximal tolerable time backend needs to flush so that points are available",
  "setup": "Setup device and components for subtest"
};

module.exports = {
  test: test,
  descriptions: descriptions
};
