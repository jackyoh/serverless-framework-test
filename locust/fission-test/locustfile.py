from locust import HttpUser, task

class HelloWorldUser(HttpUser):
    @task
    def hello_world(self):
        response = self.client.request(
            method='GET',
            url='/hello-python',
        )
        print(response)
