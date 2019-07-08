# Image is ubuntu latest with apache http installed 
# demo of dockerfile build. 

ARG VERSION=latest
FROM ubuntu:$VERSION

RUN apt-get update && apt-get install -y git
RUN apt-get install apache2 -y
EXPOSE 80 
