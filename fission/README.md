## Fission 使用說明

* 建立環境指令如下：
```
$ fission environment create --name python --image fission/python-env
```

* 建立 function 指令如下:
```
$ fission fn create --name hello-python --env python --code hello.py --minscale 0 --maxscale 3 --executortype newdeploy
$ fission fn list
$ fission fn test --name hello-python
```

* 建立 router 指令如下：
```
$ fission route create --function hello-python --url /hello-python --method GET
```

* 查看連線 port 指令如下：
```
$ kubectl get services --all-namespaces
```

* client 連線到 function 指令如下
```
$ curl -X GET http://192.168.100.175:31314/hello-python
```

