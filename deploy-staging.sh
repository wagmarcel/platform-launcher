export DOCKER_TAG=nightly-2019-11-09
export KUBECONFIG=/root/.kube/config-oisp-staging.yaml
export HELM_ARGS="--set stolon.persistence.storageClassName=\"ionos-enterprise-hdd\" --set less_resources=\"false\" "
export NAMESPACE=oisp-staging
make deploy-oisp
