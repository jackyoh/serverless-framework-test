def handler(context, event):
    context.logger.info("hello world test .....")
    return context.Response(body="Hello World test....",
                            headers={},
                            content_type="text/plain",
                            status_code=200)
