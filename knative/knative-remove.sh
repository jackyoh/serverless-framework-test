#!/bin/bash
kubectl delete -f https://github.com/knative/serving/releases/download/knative-v1.8.0/serving-crds.yaml
kubectl delete -f https://github.com/knative/serving/releases/download/knative-v1.8.0/serving-core.yaml
kubectl delete -l knative.dev/crd-install=true -f https://github.com/knative/net-istio/releases/download/knative-v1.8.0/istio.yaml
kubectl delete -f https://github.com/knative/net-istio/releases/download/knative-v1.8.0/istio.yaml
kubectl delete -f https://github.com/knative/net-istio/releases/download/knative-v1.8.0/net-istio.yaml
kubectl delete -f https://github.com/knative/eventing/releases/download/knative-v1.8.1/eventing-crds.yaml
kubectl delete -f https://github.com/knative/eventing/releases/download/knative-v1.8.1/eventing-core.yaml
kubectl delete -f https://github.com/knative/eventing/releases/download/knative-v1.8.1/in-memory-channel.yaml
kubectl delete -f https://github.com/knative/eventing/releases/download/knative-v1.8.1/mt-channel-broker.yaml
