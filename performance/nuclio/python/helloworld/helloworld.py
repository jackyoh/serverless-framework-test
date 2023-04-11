def handler(context, event):
    return context.Response(body="Hello World",
                            headers={},
                            content_type="text/plain",
                            status_code=200)
