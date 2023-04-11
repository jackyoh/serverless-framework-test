* 建立 docker image 指令如下：
```
$ docker build -t jackyoh/test-java . --no-cache
```

* docker image push 到 docker hub 指令如下：
```
$ docker push jackyoh/test-java
```

* 建立 Knative 服務：
```
$ kubectl apply -f service.yaml
```

* 修改 istio gateway 設定
```
$ kubectl edit service istio-ingressgateway -n istio-system

spec:
  externalIPs:
  - 192.168.100.175
```

* client 連到 knative 函數, 指令如下:
```
$ curl -X GET -H "Host: test-java.default.example.com" 192.168.100.175:30028
```
