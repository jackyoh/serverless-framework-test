#!/bin/bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
sudo bash get_helm.sh

kubectl create namespace fission
kubectl create -k "github.com/fission/fission/crds/v1?ref=v1.17.0"
helm repo add fission-charts https://fission.github.io/fission-charts/
helm repo update
helm install --version v1.17.0 --namespace fission fission --set serviceType=NodePort,routerServiceType=NodePort fission-charts/fission-all

kubectl apply -f ./fission-pv.yaml

curl -Lo fission https://github.com/fission/fission/releases/download/v1.17.0/fission-v1.17.0-linux-amd64 \
    && chmod +x fission && sudo mv fission /usr/local/bin/
