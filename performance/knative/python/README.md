* 建立 docker image 和 push 到 docker hub 指令如下：
```
$ docker build -t jackyoh/test-python . --no-cache
$ docker push jackyoh/test-python
```

* 執行 knative 指令如下：
```
$ kubectl apply -f service.yaml
```

* client 連到 knative 函數, 指令如下:
```
$ curl -X GET -H "Host: test-python.default.example.com" 192.168.100.175:30028
```