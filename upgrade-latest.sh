export NAMESPACE=oisp-ci
export KUBECONFIG=/home/marcel/.kube/config_ci_k3s
export DOCKER_TAG=latest
export NODOCKERLOGIN=
kubectl -n ${NAMESPACE} delete jobs dbsetup dbupdate
make upgrade-oisp
