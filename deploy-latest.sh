
export NAMESPACE=oisp-ci
export KUBECONFIG=~/.kube/config_ci_k3s
export DOCKER_TAG=nightly-2020-02-18
make deploy-oisp
