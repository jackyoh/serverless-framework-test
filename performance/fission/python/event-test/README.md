### 使用 fission 建立 event
* 打包 jar 檔
```
$ zip -jr test.zip event-test/
```

* build package
```
$ fission env create --name python --image fission/python-env --builder fission/python-builder
$ fission package create --sourcearchive test.zip --env python --buildcmd "./build.sh"
```

* 執行 function
```
$ fission fn create --name hello-python --env python --pkg test-zip-jer8 --minscale 0 --maxscale 3 --entrypoint "main.main" --executortype newdeploy
```

* 啟動排程
```
$ fission timer create --name cronjobtrigger --function hello-python --cron "0 */1 * * * *"
```

* 查看 log
```
$ kubectl exec newdeploy-hello-python-default-9bf9-cfc86a9e1148-665f95d4d5lxfn -n fission-function cat /tmp/result.txt
```