FROM ubuntu

MAINTAINER ahunnargikar@ebay.com

RUN echo deb http://archive.ubuntu.com/ubuntu precise universe > /etc/apt/sources.list.d/universe.list
RUN apt-get update

#Install packages
RUN apt-get -y install wget curl git-core nano default-jdk maven

#Install Tomcat
RUN apt-get install -y tomcat7 tomcat7-docs tomcat7-admin

#Install & configure Supervisor
RUN apt-get -y install supervisor
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

#HTTP port
EXPOSE 8080

#Run Supervisor
CMD ["/usr/bin/supervisord"]