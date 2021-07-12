FROM amd64/tomcat:9.0
RUN apt update -y
RUN apt install default-jdk -y
RUN apt install maven -y
RUN apt install git -y
WORKDIR /root
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /root/boxfuse-sample-java-war-hello
RUN mvn -f pom.xml package
RUN cp /root/boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps/
ADD catalina.sh /usr/share/tomcat9/bin/catalina.sh
EXPOSE 8080

CMD ["catalina.sh", "run"]
