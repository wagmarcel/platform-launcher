export NAMESPACE=oisp-staging
export KUBECONFIG=${HOME}/.kube/config-oisp-staging.yaml
export DOCKER_TAG=nightly-2020-06-30
export HELM_ARGS="--set stolon.persistence.storageClassName=\"ionos-enterprise-hdd\" --set less_resources=\"false\" --set production=\"true\" "
make upgrade-oisp
