### Knative 使用說明

* 測試 knative 服務是否正常，指令如下：
```
$ kn service create hello --image gcr.io/knative-samples/helloworld-go --port 8080 --env TARGET=World
$ kubectl get ksvc --all-namespaces
```

* 修改 istio gateway 設定 
```
$ kubectl edit service istio-ingressgateway -n istio-system

spec:
  externalIPs:
  - 192.168.100.164
```

* client 連到 knative service, 指令如下:
```
$ curl -X GET -H "Host: hello.default.example.com" 192.168.100.164:32407
```

32407 port 是從 kubectl get service --all-namespaces 指令, 查詢 istio-ingressgateway 得到 80:32407。

* 刪除 knative service, 指令如下:
```
$ kn service delete hello
```
