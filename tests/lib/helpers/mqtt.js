/**
 * Copyright (c) 2019 Intel Corporation
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

//-------------------------------------------------------------------------------------------------------
// Helper Functions
//-------------------------------------------------------------------------------------------------------

var Metric = require('../data/Metric.data').init();


function setCredential(connector, deviceToken, deviceId, cb) {
    if (!cb) {
        throw "Callback required";
    }

    var deviceInfo = {
        device_id: deviceId,
        device_token: deviceToken
    };
    connector.setCredential(deviceId, deviceToken)
    cb(null, "OK");
}

function submitData(connector, value, deviceToken, accountId, deviceId, cid, cb) {
    if (!cb) {
        throw "Callback required";
    }
    var ts = new Date().getTime();
    console.log("submit data value on helpers.mqtt", value)
    console.log("value", value[0].value)
    var data = {
        cid: cid,
        userToken: deviceToken,
        deviceId: deviceId,
        accountId: accountId,
        did: deviceId,
        on: ts,
        value: value[0].value,
        // body: {
        //     accountId: accountId,
        //     on: ts,
        //     value: value[0].value,
        //     data: [{
        //         componentId: cid,
        //         value: value[0].value,
        //         on: ts
        //     }]
        // }
    }
    var metric = new Metric();
    metric.set(data);
    connector.data(metric, function(err, response) {
        if (err) {
            cb(err)
        } else {
            if (response) {
                cb(null, response)
            }
        }
    });
}


module.exports={
    setCredential: setCredential,
    submitData: submitData
}