export KUBECONFIG=$HOME/.kube/config_ci_k3s
#export HELM_ARGS="--set stolon.persistence.storageClassName=\"ionos-enterprise-hdd\" --set less_resources=\"false\" --set production=\"true\" "
export HELM_ARGS="--force --atomic --set less_resources=\"false\" --set production=\"true\" "
export NAMESPACE=oisp-ci
export DOCKER_TAG=nightly-2020-09-09
make upgrade-oisp
