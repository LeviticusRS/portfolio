FROM openjdk:8-jre-alpine

ENV APPLICATION_USER ktor
RUN adduser -D -g '' $APPLICATION_USER

RUN mkdir /app
RUN chown -R $APPLICATION_USER /app

USER $APPLICATION_USER

COPY ./build/libs/portfolio-0.0.1.jar /app/portfolio-0.0.1.jar
WORKDIR /app

EXPOSE 8080:80

CMD ["java", "-server", "-jar", "portfolio-0.0.1.jar"]