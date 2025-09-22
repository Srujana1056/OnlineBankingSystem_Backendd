# Use a Java 17 JDK base image
FROM eclipse-temurin:17-jdk-jammy

# Set working directory in the container
WORKDIR /app

# Copy Maven build files
COPY pom.xml .
COPY src ./src

# Install Maven and build the project
RUN apt-get update && \
    apt-get install -y maven && \
    mvn clean package -DskipTests

# Copy the jar to the working directory
COPY target/*.jar app.jar

# Expose the backend port
EXPOSE 8003

# Command to run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
