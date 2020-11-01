export KUBECONFIG=${HOME}/.kube/kubeconfig-ibn4.0.yaml
NAMESPACE=industryfusion
CONFIGMAPNAME=if-config
# DRYRUN=--dry-run
# set DOCKERUSER
# set DOCKERPASS
# set DOCKEREMAIL

# Create credentials for private repos in dockerhub
#echo creating dockerhub credentials ...
#kubectl -n ${NAMESPACE} create secret docker-registry regcred --docker-server=docker.io --docker-username=${DOCKERUSER} --docker-password=${DOCKERPASS} --docker-email=${DOCKEREMAIL} -o yaml --dry-run | kubectl apply ${DRYRUN} -f -

# create/update configmap
echo create or update configmap
kubectl -n ${NAMESPACE} create configmap ${CONFIGMAPNAME} --from-file configs -o yaml --dry-run | kubectl replace ${DRYRUN} -f -

# deploy all yamls
for yaml in createdb.yaml; do
    echo deploying $yaml ...
    kubectl -n ${NAMESPACE} delete -f ${yaml} ${DRYRUN}
    kubectl -n ${NAMESPACE} create -f ${yaml} ${DRYRUN}
done
