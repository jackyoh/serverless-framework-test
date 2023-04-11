* 建立環境指令如下：
```
$ fission env create --name java-test --image fission/jvm-env --version 2 --keeparchive --builder fission/jvm-builder
```

* 打包 function 以及建立 function 指令如下：
```
$ zip -r java-src-pkg.zip *
$ fission package create --sourcearchive java-src-pkg.zip --env java-test
$ fission package list
$ fission package info ${package_name}
$ fission fn create --name helloworld --env java-test --pkg java-src-pkg-zip-bq3v --entrypoint idv.jack.HelloWorld --minscale 0 --maxscale 3 --executortype newdeploy
```

* 建立 router 指令如下：
```
$ fission route create --function helloworld --url /helloworld --method GET
```

* client 連線到 function 指令如下：
```
$ time curl -X GET http://192.168.100.175:31314/helloworld
```

* 暖啟動指令如下：
```
$ fission fn create --name helloworld --env java-test --pkg java-src-pkg-zip-1i5a --entrypoint idv.jack.HelloWorld --executortype='poolmgr' --con 1000
```
