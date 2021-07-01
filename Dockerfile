FROM ubuntu:20.04
RUN apt update
RUN apt install default-jdk -y
RUN apt install tomcta9 -y
RUN apt install maven -y
RUN apt install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello/
RUN mvn package
RUN cp /target/hello-1.0.war /var/lib/tomcat9/webapps/

EXPOSE 80
RUN rm -rf /var/www/html/*
ADD index.html /var/www/html/
CMD ["nginx", "-g", "daemon off;"]