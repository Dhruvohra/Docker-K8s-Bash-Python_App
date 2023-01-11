FROM python:3.9-slim-buster
WORKDIR /app2
COPY ./requirements.txt /app2
RUN pip install -r requirements.txt
COPY . .
EXPOSE 5000
ENV FLASK_APP=main.py
CMD ["flask", "run", "--host", "0.0.0.0"]
