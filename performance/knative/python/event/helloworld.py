from flask import Flask, request, make_response
import uuid
import time
import requests
import json
app = Flask(__name__)

@app.route('/', methods=['POST'])
def hello_world():
    app.logger.info("Start......")
    start_time = time.time()
    headers = {"user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.75 Safari/537.36 Edg/100.0.1185.36"}
    for i in range(60):
        x = requests.get("https://....?pages={}".format(i+1), headers=headers)
        prods = json.loads(x.content.decode("utf-8"))["prods"]
        for prod in prods:
            print("Name: {}".format(prod["name"]))
            print("Price: {}".format(prod["price"]))

    response = make_response({
        "msg": "testing parser"
    })
    response.headers["Ce-Id"] = str(uuid.uuid4())
    response.headers["Ce-specversion"] = "0.3"
    response.headers["Ce-Source"] = "knative/eventing/samples/hello-world"
    response.headers["Ce-Type"] = "dev.knative.samples.hifromknative"
    end_time = time.time()
    app.logger.info("Running total time is {}".format(end_time - start_time))
    app.logger.info("End......")
    return response

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=8080)
