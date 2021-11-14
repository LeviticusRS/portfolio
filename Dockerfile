FROM gradle:7.3.0-jdk8
EXPOSE 8080:80
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
ENTRYPOINT ["gradle", "run"]