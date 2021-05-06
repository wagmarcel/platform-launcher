export NAMESPACE=oisp-staging
export NOBACKUP=true
export KUBECONFIG=${HOME}/.kube/kubeconfig-ibn40dev.yaml
export DOCKER_TAG=v2.0.2-beta.1
export HELM_ARGS="--set stolon.persistence.storageClassName=\"ionos-enterprise-hdd\" --set less_resources=\"true\" --set production=\"false\" "
make upgrade-oisp
