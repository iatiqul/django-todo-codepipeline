FROM python:3.7-alpine
RUN mkdir /code
WORKDIR /code
COPY . /code
RUN apk add python3-dev build-base linux-headers pcre-dev
RUN pip install uwsgi
RUN pip install -r requirements.txt

#CMD ["uwsgi", "--ini", "/code/mysite.uwsgi.ini"]
