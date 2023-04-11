* 建立環境指令如下：
```
$ fission environment create --name python --image fission/python-env
```

* 建立 function 指令如下：
```
$ fission fn create --name hello-python --env python --code hello.py --minscale 0 --maxscale 3 --executortype newdeploy
$ fission fn list
$ fission fn test --name hello-python
```

* 建立 router 指令如下：
```
$ fission route create --function hello-python --url /hello-python --method GET
```

* client 連線到 function 指令如下：
```
$ time curl -X GET http://192.168.100.175:31314/hello-python
```

* 暖啟動指令如下：
```
$ fission fn create --name hello-python --env python --code hello.py --executortype poolmgr --con 1000
```

* 建構第三方元件 package 指令如下：
```
$ fission env create --name python --image fission/python-env --builder fission/python-builder
$ zip -jr test.zip python/
$ fission package create --sourcearchive test.zip --env python --buildcmd "./build.sh"
$ fission fn create --name hello-python --env python --pkg test-zip-mzyf --minscale 0 --maxscale 3 --entrypoint "hello.main" --executortype newdeploy
```
