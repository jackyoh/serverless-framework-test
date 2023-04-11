#!/bin/bash
# Install istio for the network
curl -L https://istio.io/downloadIstio | sh -
mv istio* istio
export PATH=/home/user1/istio/bin:$PATH
istioctl install

# Install knative serving
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.8.0/serving-crds.yaml
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.8.0/serving-core.yaml
kubectl apply -l knative.dev/crd-install=true -f https://github.com/knative/net-istio/releases/download/knative-v1.8.0/istio.yaml
kubectl apply -f https://github.com/knative/net-istio/releases/download/knative-v1.8.0/istio.yaml
kubectl apply -f https://github.com/knative/net-istio/releases/download/knative-v1.8.0/net-istio.yaml
kubectl --namespace istio-system get service istio-ingressgateway

# Install knative cli
wget https://github.com/knative/client/releases/download/knative-v1.8.1/kn-linux-amd64
mv kn-linux-amd64 kn
chmod +x kn
sudo mv kn /usr/local/bin

# Set temporary DNS
kubectl patch configmap/config-domain \
      --namespace knative-serving \
      --type merge \
      --patch '{"data":{"example.com":""}}'

# Install knative eventing
kubectl apply -f https://github.com/knative/eventing/releases/download/knative-v1.8.1/eventing-crds.yaml
kubectl apply -f https://github.com/knative/eventing/releases/download/knative-v1.8.1/eventing-core.yaml
kubectl apply -f https://github.com/knative/eventing/releases/download/knative-v1.8.1/in-memory-channel.yaml
kubectl apply -f https://github.com/knative/eventing/releases/download/knative-v1.8.1/mt-channel-broker.yaml

