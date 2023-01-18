# Build Stage
FROM python:3.9-slim-buster

#created a folder into docker filesystem
WORKDIR /app

#create group and user
RUN groupadd -r dev_user && useradd -g dev_user dev_user

#set ownership and permissions
RUN chown -R dev_user:dev_user /app

#switch to user
USER dev_user

COPY ./requirements.txt /app

RUN pip install -r requirements.txt

COPY . .

EXPOSE 5000

ENV FLASK_APP=main.py

CMD ["flask", "run", "--host", "0.0.0.0"]
