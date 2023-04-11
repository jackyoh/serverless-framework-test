### openfaas 使用說明：
* 測試佈署服務到 openfaas 指令如下：
```
$ faas-cli store deploy figlet
$ faas-cli list
$ arkade info openfaas
```

* 查看 store repo 有哪些 template
```
$ faas-cli template store ls
```

* 取得 store repo 的 template
```
$ faas-cli template store pull python3-flask
```

* 使用 template 建立 python3 flask
```
$ faas-cli new --lang python3-flask tester
```

* 修改 tester.yaml 的 docker image 加上 jackyoh

* 啟動服務指令如下：
```
$ faas-cli up -f tester.yml
```

參考網址：
https://www.openfaas.com/blog/openfaas-flask/
