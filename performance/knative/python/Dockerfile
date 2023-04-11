FROM python:3.7-slim

ENV PYTHONUNBUFFERED True

ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./

RUN pip install Flask gunicorn
#RUN pip install scrapy
#RUN pip install twisted
#RUN pip install pillow
#RUN pip install lxml
#RUN pip install PyYAML
#RUN pip install numpy
#RUN pip install requests

CMD exec gunicorn --bind :8080 app:app
#CMD exec gunicorn --bind :8080 app1k:app
#CMD exec gunicorn --bind :8080 app10k:app
#CMD exec gunicorn --bind :8080 app50k:app
#CMD exec gunicorn --bind :8080 app100k:app
