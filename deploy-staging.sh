export DOCKER_TAG=nightly-2019-11-09
export KUBECONFIG=/root/.kube/config-staging
export HELM_ARGS="--set stolon.persistence.storageClassName=\"oneandone\" --set less_resources=\"false\" "
export NAMESPACE=oisp-stable
make deploy-oisp
