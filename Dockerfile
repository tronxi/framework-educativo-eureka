FROM alpine/git as git
WORKDIR /repo
ADD https://api.github.com/repos/tronxi/framework-educativo-eureka/git/refs/heads/develop version.json
RUN git clone https://github.com/tronxi/framework-educativo-eureka.git
RUN cd framework-educativo-eureka && git checkout develop

FROM maven as builder
COPY --from="git" /repo/framework-educativo-eureka .
RUN mvn package spring-boot:repackage

FROM openjdk:8-alpine
ENV profile dev
COPY --from="builder" /target/framework-educativo-0.0.1-SNAPSHOT.jar .
CMD java -jar -Dspring.profiles.active=${profile} framework-educativo-0.0.1-SNAPSHOT.jar