NODENAME=${1:-NODENAME}
NAMESPACE=${NAMESPACE:-oisp-devices}
CONFIG_MAP_NAME=app-config
if [ "$#" -gt 2 -o "$#" -lt 1 ]; then
	echo usage: ${0##*/} \<node-name\> [instance-number]
	echo e.g. ${0##*/} myworker 1
	exit 1
fi
if [ ! -z "$2" ]; then
	ID=-$2
fi

echo Creating subdir for node $NODENAME$ID
mkdir -p $NODENAME$ID
echo Copy and adapt the templates
for file in $(ls *.yaml); do
	echo Processing $file
	sed 's|<NODENAME>|'$NODENAME'|g' $file | sed 's|<ID>|'$ID'|g' | sed 's|<NAMESPACE>|'$NAMESPACE'|g' > $NODENAME$ID/$file
done
kubectl -n ${NAMESPACE} create configmap $NODENAME${ID}-${CONFIG_MAP_NAME}  --from-file=./$NODENAME$ID/application.yaml  --from-file=./$NODENAME$ID/fusiondbdataservice_application.yaml  -o yaml --dry-run > $NODENAME$ID/configmap.yaml
cat $NODENAME$ID/configmap.yaml > $NODENAME$ID/all.yaml
echo --- >> $NODENAME$ID/all.yaml
cat $NODENAME$ID/pvc.yaml >> $NODENAME$ID/all.yaml
echo --- >> $NODENAME$ID/all.yaml
cat $NODENAME$ID/deployment.yaml >> $NODENAME$ID/all.yaml
