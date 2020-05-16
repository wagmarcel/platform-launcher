Ingress controller version 0.30
deploy instructions taken from:
https://github.com/kubernetes/ingress-nginx/blob/nginx-0.30.0/docs/deploy/index.md

First do the "mandatory":
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/mandatory.yaml

and then the "generic" CSP specific part:
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/provider/cloud-generic.yaml

for IONOS managed kubernetes, then edit the service "ingress-nginx" in ns "ingress-nginx" and change

"externalTrafficPolicy: Local"
to
"externalTrafficPolicy: Cluster"

then adapt namespace part of data entry in "tcp-services.yaml" in this directory. e.g.
data:
  8883: "oisp-namespace/mqtt-server:8883"


finally add the new ports to svc/ingress-nginx:
kubectl -n ingress-nginx edit svc/ingress-nginx

  - name: mqtts
    port: 8883
    protocol: TCP
    targetPort: 8883

