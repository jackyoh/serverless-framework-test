#!/bin/bash
docker login
docker build -t jackyoh/helloworld-python .
docker push jackyoh/helloworld-python
kubectl apply -f service.yaml
