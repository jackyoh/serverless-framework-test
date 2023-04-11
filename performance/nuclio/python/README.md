### 測試 Nuclio 函數，使用說明
* 執行 Nuclio Function 指令如下：
```
$ nuctl deploy helloworld --path ./helloworld --http-trigger-service-type NodePort
```

* 使用 curl 指令測試 Web Server 的連線是否正常：
```
$ curl -X GET http://10.100.0.157:30639
```

* 執行非同步測試指令如下：
```
$ nuctl deploy testevent --path ./test-event
```
