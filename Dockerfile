FROM openjdk:8-jdk-alpine
COPY app.jar /app/app.jar
ENTRYPOINT ["java",  "-jar", "/app/app.jar"]

# unneccesary comment