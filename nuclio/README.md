### 建立 nuclio function 指令如下：
```
$ docker login
$ nuctl deploy helloworld \
    --namespace nuclio \
    --http-trigger-service-type NodePort \
    --path https://raw.githubusercontent.com/nuclio/nuclio/master/hack/examples/golang/helloworld/helloworld.go \
    --registry docker.io/jackyoh
```

### 查詢 nuclio function 指令如下：
```
$ nuctl get functions -n nuclio
$ nuctl invoke helloworld --method POST --body '{"hello":"world"}' --content-type "application/json" -n nuclio
$ curl -X GET http://10.100.0.180:31814
```
