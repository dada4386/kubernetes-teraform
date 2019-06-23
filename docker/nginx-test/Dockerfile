FROM nginx:latest
LABEL maintainer "dada <ex.smash@gmail.com>"

# apt-get
RUN apt-get update && \
    apt-get install -y vim git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 80
EXPOSE 443

