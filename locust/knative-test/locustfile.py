from locust import HttpUser, task

class HelloWorldUser(HttpUser):
    @task
    def hello_world(self):
        response = self.client.request(
            method='GET',
            url='/',
            headers={"Host": "test-python.default.example.com"}
        )
        print(response)
