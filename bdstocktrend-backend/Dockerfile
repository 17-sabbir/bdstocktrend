# Use a base image that supports multiple platforms
FROM --platform=linux/amd64 openjdk:17-jdk-slim

WORKDIR /app

# Copy the rest of the project files to the container
COPY build/libs/BDStockTrend-backend-0.0.1-SNAPSHOT.jar app.jar

# Expose the port on which the app will run (typically 8080 for Spring Boot)
EXPOSE 8080

# The command to run your application
CMD ["java", "-jar", "app.jar"]
