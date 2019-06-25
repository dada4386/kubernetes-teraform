FROM python:alpine
LABEL maintainer "dada <ex.smash@gmail.com>"

RUN pip install flask
COPY hello.py /app/
EXPOSE 3000

ENTRYPOINT ["python3","./app/hello.py"]
