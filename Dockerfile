FROM openjdk:8-jdk-alpine
COPY target/*.jar /app/app.jar
ENTRYPOINT ["java",  "-jar", "/app/app.jar"]

# unneccesary comment