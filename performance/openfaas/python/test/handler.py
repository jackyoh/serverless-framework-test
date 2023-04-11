import logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)
def handle(req):
    logger.info("Hello World")
    return "Hello World"
