# Should be called from backend directory, e.g. ..../platform-launcher/oisp-backend
pushd .
cd ../util/debug/mqtt-server
NAMESPACE=oisp
echo Namespace: ${NAMESPACE}

if [ ! ${#BASH_SOURCE[@]} -eq 1 ]; then
    echo script should be sourced to prepare environment!
    exit 1;
fi

# Find backend instance. Assumes that only one instance exists
MQTTSERVER=$(kubectl -n ${NAMESPACE} get pods| grep mqtt-server| cut -d " " -f 1)
# Source environment
#kubectl -n ${NAMESPACE} exec ${POD_NAME} -- /bin/bash -c "export -p"
source <( kubectl -n ${NAMESPACE} exec ${MQTTSERVER} -c mqtt-broker -- /bin/bash -c "export -p"  | grep -v "HOME\|PWD\|OLDPWD\|TERM\|PATH\|HOSTNAME")
source <( kubectl -n ${NAMESPACE} exec ${MQTTSERVER} -c mqtt-gateway -- /bin/bash -c "export -p"  | grep -v "HOME\|PWD\|OLDPWD\|TERM\|PATH\|HOSTNAME")
##########################
# Replace backend Service
# create headless service
##########################
IPADDRESS=$(hostname -I | cut -d " " -f 1)
echo selected IP address ${IPADDRESS}
kubectl -n ${NAMESPACE} delete svc mqtt-server
cat << EOF | kubectl -n ${NAMESPACE} create -f -
apiVersion: v1
kind: Service
metadata:
  name: mqtt-server
  namespace: ${NAMESPACE}
spec:
  clusterIP: None
  ports:
  - protocol: TCP
    port: 8883
    targetPort: 8883
    name: "8883"
---
apiVersion: v1
kind: Endpoints
metadata:
  name: mqtt-server
  namespace: ${NAMESPACE}
subsets:
- addresses:
  - ip: ${IPADDRESS}
  ports:
  - port: 8883
    name: "8883"
EOF

popd
BROKER_CONF=${OISP_MQTT_BROKER_CONFIG//\/app/$PWD/data}
BROKER_CONF=${BROKER_CONF//\/ssl\///}
export OISP_MQTT_BROKER_CONFIG=${BROKER_CONF//cert/crt}

echo all prepared
