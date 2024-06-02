FROM openjdk:17-jdk-slim
WORKDIR /app
COPY target/spring-boot-github-action-demo.jar spring-boot-github-action-demo.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/spring-boot-github-action-demo.jar"]