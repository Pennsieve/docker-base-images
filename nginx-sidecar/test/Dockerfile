from python:3.7-slim

RUN pip install --upgrade pip

WORKDIR /app

COPY ./requirements.txt ./
RUN pip install -r requirements.txt

COPY ./app.py ./
