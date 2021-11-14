FROM openjdk:8-jre-alpine

ENV APPLICATION_USER ktor
RUN adduser -D -g '' $APPLICATION_USER

RUN mkdir /app
RUN chown -R $APPLICATION_USER /app

USER $APPLICATION_USER

COPY ./build/libs/portfolio-0.0.1.jar /app/portfolio-0.0.1.jar
WORKDIR /app

EXPOSE 8080:80

CMD ["java", "-server", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap",
"-XX:InitialRAMFraction=2", "-XX:MinRAMFraction=2", "-XX:MaxRAMFraction=2", "-XX:+UseG1GC",
"-XX:MaxGCPauseMillis=100", "-XX:+UseStringDeduplication", "-jar", "portfolio-0.0.1.jar"]