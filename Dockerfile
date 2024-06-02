# Stage 1: Build the application using Maven
FROM maven:3.8.5-openjdk-17 AS build

# Set the working directory
WORKDIR /app

# Copy the pom.xml file and download the dependencies
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy the entire project and build the application
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Create the final image with JRE
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the built jar from the previous stage
COPY --from=build /app/target/spring-boot-github-action-demo.jar .

# Expose the port that the app will run on
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "spring-boot-github-action-demo.jar"]
