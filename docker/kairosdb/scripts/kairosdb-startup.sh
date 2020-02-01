#!/bin/bash
# Copyright (c) 2020 Intel Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

CONFIG_FILE=/opt/kairosdb/conf/kairosdb.properties

function replace_config {
  config_line=$1
  replacement="${config_line} = ${2//\//\\/}"
  line_start=$3
  echo sed -i "s/${line_start}.*${config_line} =.*$/${replacement}/" ${CONFIG_FILE}
  sed -i "s/${line_start}.*${config_line} =.*$/${replacement}/" ${CONFIG_FILE}
}

function add_config {
  config_line=$1
  replacement="${config_line} = $2"
  echo "${replacement}" >> ${CONFIG_FILE}
}

function disable_config {
    config_line=$1
    echo sed -i "s/${config_line}/\#${config_line}/" ${CONFIG_FILE}
    sed -i "s/${config_line}/\#${config_line}/" ${CONFIG_FILE}
}

echo "Starting $0"
CASSANDRAHOST=$(echo ${OISP_KAIROSDB_CONFIG} | jq   '.cassandraHost' | tr -d '"')
PORT=$(echo ${OISP_KAIROSDB_CONFIG} | jq '.port')
REPLICATIONFACTOR=$(echo ${OISP_KAIROSDB_CONFIG} | jq '.replicationFactor')
echo "Found CASSANDRAHOST=${CASSANDRAHOST} PORT=${PORT} REPLICATIONFACTOR=${REPLICATIONFACTOR}"

# update the config file
replace_config "kairosdb.datastore.cassandra.host_name" ${CASSANDRAHOST} "#"
replace_config "kairosdb.datastore.cassandra.port" ${PORT} "#"
replace_config "kairosdb.datastore.cassandra.replication_factor" ${REPLICATIONFACTOR} "#"
disable_config "kairosdb.service.datastore=org.kairosdb.datastore.h2.H2Module"

/opt/kairosdb/bin/kairosdb.sh run
