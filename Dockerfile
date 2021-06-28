FROM openjdk:8-jdk-alpine


ARG VERSION

COPY app.jar /app/${VERSION}.jar

RUN ls app/

ENTRYPOINT ["java",  "-jar", "/app/spring-petclinic-${VERSION}.jar"]
