### Knative 的 event 使用說明
1. build 和 push image 指令如下：
```
$ docker build -t jackyoh/helloworld-python . --no-cache
$ docker push jackyoh/helloworld-python
```

2. 建立 broker, trigger 和 service 的服務如下指令：
```
$ kubectl apply -f service.yaml
```

3. 啟動 curl container 和觸發 event 指令如下：
```
$ kubectl run curl-test --image=radial/busyboxplus:curl -i --tty --rm
$ curl -v "http://broker-ingress.knative-eventing.svc.cluster.local/knative-samples/default" -X POST -H "Ce-Id: 536808d3-88be-4077-9d7a-a3f162705f79" -H "Ce-specversion: 0.3" -H "Ce-Type: dev.knative.samples.helloworld" -H "Ce-Source: dev.knative.samples/helloworldsource" -H "Content-Type: application/json"
```

4. 查看執行的結果
```
$ kubectl logs -f helloworld-python-00001-deployment-8498c64c7-d8zx4 -n knative-samples
```
