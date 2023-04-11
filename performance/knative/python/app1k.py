import os
from flask import Flask

app = Flask(__name__)

@app.route('/hello1k')
def hello_world():
    print("Hello Python, For the cold start test.")
    print("Hello Python, For the cold start test.")
    print("Hello Python, For the cold start test.")
    print("Hello Python, For the cold start test.")
    print("Hello Python, For the cold start test.")
    print("Hello Python, For the cold start test.")
    print("Hello Python, For the cold start test.")
    print("Hello Python, For the cold start test.")
    print("Hello Python, For the cold start test.")
    print("Hello Python, For the cold start test.")
    print("Hello Python, For the cold start test.")
    print("Hello Python, For the cold start test.")
    print("Hello Python, For the cold start test.")
    print("Hello Python, For the cold start test.")
    print("Hello Python, For the cold start test.")
    return 'Hello Python. Cold start 1k test!\n'

if __name__ == "__main__":
    app.run(debug=True,host='0.0.0.0',port=int(os.environ.get('PORT', 8080)))