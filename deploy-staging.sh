export KUBECONFIG=/root/.kube/config-loadtests
export HELM_ARGS="--set stolon.persistence.storageClassName=\"oneandone\" --set less_resources=\"false\" "
export NAMESPACE=oisp-staging
make deploy-oisp
