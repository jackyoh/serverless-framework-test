測試從 curl 發送 event 到 broker 之後由 trigger 接收到訊息傳送到 sink 端，印出 log

步驟如下：

1. create broker:
```
$ kn broker create bk1 --namespace test-event
```

2. create sink 用來接收資料：
```
$ kn service create event-display --image gcr.io/knative-releases/knative.dev/eventing/cmd/event_display --namespace test-event
```

3. 建立 trigger 接收 broker 的資料:
trigger.yaml
```
apiVersion: eventing.knative.dev/v1
kind: Trigger
metadata:
  name: my-service-trigger
  namespace: test-event
spec:
  broker: bk1
  subscriber:
    ref:
      apiVersion: serving.knative.dev/v1
      kind: Service
      name: event-display
```
kubectl apply -f trigger.yaml

4. 建立 curl container 用來建立事件給 broker
curl.yaml
```
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: curl
  name: curl
spec:
  containers:
    # This could be any image that we can SSH into and has curl.
  - image: radial/busyboxplus:curl
    imagePullPolicy: IfNotPresent
    name: curl
    resources: {}
    stdin: true
    terminationMessagePath: /dev/termination-log
    terminationMessagePolicy: File
    tty: true
```
執行指令，如下：
```
$ kubectl apply -f curl-pod.yaml
$ kubectl attach curl -it
$ curl -X POST -H "Ce-Id: say-hello" -H "Ce-Specversion: 1.0" -H "Ce-Type: event-display" -H "Ce-Source: from-curl" -H "Content-Type: application/json
" -d '{"msg":"Hello Knative3!"}' http://broker-ingress.knative-eventing.svc.cluster.local/test-event/bk1
```

參考網址：
* https://opensource.com/article/21/2/knative-eventing
* https://github.com/knative/docs/tree/main/code-samples/eventing/helloworld/helloworld-python
* https://github.com/meteatamel/knative-tutorial/blob/master/docs/helloworldeventing.md
