* 建立環境指令如下：
```
$ fission environment create --name go --image fission/go-env-1.16 --builder fission/go-builder-1.16
```

* 建立 function 指令如下：
```
$ fission package list
$ fission fn create --name hello-go --env go --src hello.go --entrypoint Handler --minscale 0 --maxscale 3 --executortype newdeploy
$ fission fn list
```

* 建立 route 指令如下：
```
$ fission route create --function hello-go --url /hello-go --method GET
```

* client 連線到 function 指令如下：
```
$ time curl -X GET http://192.168.100.175:31314/hello-go
```

* 查看 volume 在 pod mount 的狀態
```
$ kubectl edit pod newdeploy-hello-go-default-adb8-2aad52512362-67fbcbf474-k8mm6 -n fission-function
```
userfunc 的資料夾是透過 volume 的方式 mount

* 使用第三方元件指令如下：
```
$ fission fn create --name hello-go --env go --src go.mod --src go.sum --src hello.go --entrypoint Handler --minscale 0 --maxscale 3 --executortype newdeploy
```

* 暖啟動指令如下：
```
$ fission fn create --name hello-go --env go --src hello.go --entrypoint Handler --executortype poolmgr --con 1000
```
