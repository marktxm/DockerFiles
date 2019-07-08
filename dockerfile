# Image is ubuntu latest with Tomcat installed 
# demo of dockerfile build. 


ARG VERSION=latest
FROM unbuntu:$VERSION

# install openJDK

RUN sudo apt update
RUN sudo apt install default-jdk

# create TC user

RUN sudo useradd -r -m -U -d /opt/tomcat -s /bin/false tomcat

#download TC and move files

RUN wget http://www-eu.apache.org/dist/tomcat/tomcat-9/v9.0.14/bin/apache-tomcat-9.0.14.tar.gz -P /tmp

RUN sudo tar xvfz /tmp/apache-tomcat-9*.tar.gz -C /opt/tomcat

RUN sudo ln -s /opt/tomcat/apache-tomcat-9.0.14 /opt/tomcat/latest

RUN sudo chown -RH tomcat: /opt/tomcat/latest

RUN sudo sh -c 'chmod +x /opt/tomcat/latest/bin/*.sh'

EXPOSE 8080

CMD /opt/tomcat/bin/catalina.sh run



