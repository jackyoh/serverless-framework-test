import time
import requests
import json
import sys

def handle(req):
    with open('/tmp/result.txt', 'w') as f:
        start_time = time.time()
        headers = {"user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36"}
        for i in range(60):
            x = requests.get("https://....?pages={}".format(i+1), headers=headers)
            prods = json.loads(x.content.decode("utf-8"))["prods"]
            for prod in prods:
                f.write("Name: {}\n".format(prod["name"]))
                f.write("Price: {}\n".format(prod["price"]))
        end_time = time.time()
        f.write("Running total time is {}\n".format(end_time - start_time))
        return "Get product data"
