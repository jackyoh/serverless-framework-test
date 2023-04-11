#!/bin/bash
helm delete fission --namespace fission
kubectl delete -f ./fission-pv.yaml
