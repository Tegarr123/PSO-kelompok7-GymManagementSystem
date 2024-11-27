FROM python:3.12
WORKDIR /app
COPY . /app
RUN apt-get -y update && apt-get install -y python3-dev default-libmysqlclient-dev build-essential
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
RUN chmod +x run_app.sh
EXPOSE 5000
ENTRYPOINT ["./run_app.sh"]