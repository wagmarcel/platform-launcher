export NAMESPACE=oisp-staging
export KUBECONFIG=${HOME}/.kube/kubeconfig-ibn4.0.yaml
export DOCKER_TAG=1.3-beta.1
export HELM_ARGS="--set stolon.persistence.storageClassName=\"ionos-enterprise-hdd\" --set less_resources=\"false\" --set production=\"true\" "
make upgrade-oisp
