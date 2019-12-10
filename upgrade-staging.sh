export KUBECONFIG=/root/.kube/config-oisp-staging.yaml
export HELM_ARGS="--set stolon.persistence.storageClassName=\"ionos-enterprise-hdd\" --set less_resources=\"false\" "
export NAMESPACE=oisp-staging
export DOCKER_TAG=v1.2-beta.1
make upgrade-oisp
