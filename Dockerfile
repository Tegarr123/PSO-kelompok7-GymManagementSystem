FROM python:3.12
WORKDIR /app
COPY app/ .
RUN apt-get -y update && apt-get install -y python3-dev default-libmysqlclient-dev build-essential pkg-config
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
EXPOSE 5000
