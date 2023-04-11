#!/bin/bash
curl -SLsf https://get.arkade.dev/ | sudo sh
arkade install openfaas
kubectl rollout status -n openfaas deploy/gateway
curl -sSL https://cli.openfaas.com | sh
sudo cp faas-cli /usr/local/bin/faas-cli
sudo ln -sf /usr/local/bin/faas-cli /usr/local/bin/faas
nohup kubectl port-forward -n openfaas svc/gateway 8080:8080 --address='0.0.0.0' &
PASSWORD=$(kubectl get secret -n openfaas basic-auth -o jsonpath="{.data.basic-auth-password}" | base64 --decode; echo)
echo -n $PASSWORD | faas-cli login --username admin --password-stdin
