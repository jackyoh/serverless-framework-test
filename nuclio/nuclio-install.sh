#!/bin/bash
echo "Please input docker hub password:"
read -s mypassword
kubectl create secret docker-registry nuclio-registry-credentials \
  --docker-username jackyoh \
  --docker-password $mypassword \
  --docker-server registry.hub.docker.com
unset mypassword
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
sudo bash get_helm.sh

git clone https://github.com/nuclio/nuclio.git
helm install nuclio nuclio/hack/k8s/helm/nuclio

# nuclio cmd install
wget https://github.com/nuclio/nuclio/releases/download/1.8.18/nuctl-1.8.18-linux-amd64
mv nuctl-1.8.18-linux-amd64 nuctl
sudo cp nuctl /usr/bin
sudo chmod 755 /usr/bin/nuctl

kubectl create namespace nuclio
