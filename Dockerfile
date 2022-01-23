FROM ubuntu:18.04
ADD examples/feed-combiner-java8-webapp/target/devops.war / 
RUN apt-get -y update && apt-get install wget unzip -y
RUN apt-get -y install openjdk-8-jdk
RUN wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.75/bin/apache-tomcat-8.5.75.zip && unzip apache-tomcat-8.5.75.zip
RUN cp devops.war ./apache-tomcat-8.5.75/webapps
RUN chmod +x ./apache-tomcat-8.5.75/bin/*
EXPOSE 8080
CMD ./apache-tomcat-8.5.75/bin/catalina.sh run 
