FROM openjdk:8-jdk-alpine

ARG VERSION

ENV VERSION_ENV=${VERSION}

COPY petclinic-${VERSION}.jar /app/petclinic-${VERSION}.jar

RUN ls app/

ENTRYPOINT java -jar /app/spring-petclinic-${VERSION_ENV}.jar