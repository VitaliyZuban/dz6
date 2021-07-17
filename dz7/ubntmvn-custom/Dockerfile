FROM amd64/tomcat:9.0
RUN apt update -y
RUN apt install default-jdk -y
RUN apt install maven -y
RUN apt install git -y
WORKDIR /root
RUN mkdir webapps
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /root/boxfuse-sample-java-war-hello
RUN mvn -f pom.xml package
RUN cp /root/boxfuse-sample-java-war-hello/target/hello-1.0.war /root/webapps/
WORKDIR /root/webapps/
RUN ls -la
RUN mkdir test_dir

CMD ["catalina.sh", "run"]