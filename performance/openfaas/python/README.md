### OpenFaaS 函數使用說明

* 取得 store repo 的 template
```
$ faas-cli template store pull python3-flask
```

* 執行 OpenFaaS 函數指令如下：
```
$ faas-cli up -f test.yml 
```

* 使用 curl 指令連到 web server 指令如下：
```
$ curl -X GET http://10.100.0.157:8080/function/test
```

* 部署非同步執行指令如下：
```
$ faas-cli up -f test-event.yml
```

* 查看 log 指令如下：
```
$ kubectl logs -n openfaas-fn deploy/test-event -f
```
