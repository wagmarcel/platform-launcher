
export NAMESPACE=oisp-ci
export KUBECONFIG=${HOME}/.kube/config_ci_k3s
export DOCKER_TAG=latest
make deploy-oisp
