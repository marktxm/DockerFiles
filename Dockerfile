# Image is ubuntu latest with Tomcat  installed 
# demo of dockerfile build. 

ARG VERSION=latest
FROM ubuntu:$VERSION

RUN apt-get update && apt-get install -y git
RUN apt-get install  default-jdk -y
RUN mkdir /usr/local/apache-tomcat9
ADD  http://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.22/bin/apache-tomcat-9.0.22.tar.gz /usr/local/apache-tomcat9 
WORKDIR /usr/local/apache-tomcat9/
RUN tar xvzf apache-tomcat-9.0.22.tar.gz
RUN echo ll 
RUN export CATALINA_HOME=/usr/local/apache-tomcat9 >> ~/.bashrc
RUN export JAVA_HOME=/usr/lib/jvm/java-11-oracle >> ~/.bashrc
RUN export JRE_HOME=/usr/lib/jvm/java-11-oracle >> ~/.bashrc
RUN exec bash
RUN chmod -R 755 ./apache-tomcat-9.0.22/bin/startup.sh
#RUN ./apache-tomcat-9.0.22/bin/startup.sh
EXPOSE 8080
