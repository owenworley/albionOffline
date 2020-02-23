FROM gradle:6.2.0-jdk8 AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle jar --no-daemon 

FROM openjdk:8-jre-slim

EXPOSE 8080

RUN mkdir /app

#COPY --from=build /home/gradle/src/build/libs/*-all.jar /app/spring-boot-application.jar
COPY --from=build /home/gradle/src/build/libs/*.* /app/

ENTRYPOINT ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-Djava.security.egd=file:/dev/./urandom","-jar","/app/AlbionStatusBot-0.99.00.jar", "--discordToken=<yourtokengoeshere>", "logging.level.root=INFO", "logging.level.org.springframework=INFO"]

