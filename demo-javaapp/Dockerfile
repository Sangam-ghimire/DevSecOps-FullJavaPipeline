# Stage 1: Build the application
FROM maven:3.9.6-eclipse-temurin-17 AS builder

# Set the working directory
WORKDIR /app

# Copy Maven project files
COPY pom.xml .
COPY src ./src

# Package the application
RUN mvn clean package -DskipTests

# Stage 2: Create a smaller final image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy only the built JAR from the previous stage
COPY --from=builder /app/target/*.jar app.jar

# Expose the application port (default Spring Boot port)
EXPOSE 8080

# Run the JAR file
ENTRYPOINT ["java", "-jar", "app.jar"]
