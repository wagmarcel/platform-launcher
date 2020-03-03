export KUBECONFIG=/root/.kube/config-oisp-staging.yaml
export HELM_ARGS="--set stolon.persistence.storageClassName=\"ionos-enterprise-hdd\" --set less_resources=\"false\" --set production=\"true\" "
export NAMESPACE=oisp-staging
export DOCKER_TAG=nightly-2020-03-01
make deploy-oisp
