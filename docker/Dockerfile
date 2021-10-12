FROM centos

MAINTAINER vaishnavirevankar@gmail.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://downloads.apache.org/tomcat/tomcat-8/v8.5.71/bin/apache-tomcat-8.5.71.tar.gz
RUN tar xvfz apache-tomcat-8.5.71.tar.gz
RUN mv apache-tomcat-8.5.71/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
ARG version
ADD Capstone-${version}.war .

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
