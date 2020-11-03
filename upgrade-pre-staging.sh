export NAMESPACE=oisp-staging
export KUBECONFIG=${HOME}/.kube/config-oisp-staging.yaml
export DOCKER_TAG=v2.0.0-beta.1
export HELM_ARGS="--set stolon.persistence.storageClassName=\"ionos-enterprise-hdd\" --set less_resources=\"false\" --set production=\"true\" "
make upgrade-oisp
