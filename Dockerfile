FROM alpine/git as git
ARG token
WORKDIR /repo
ADD https://${token}:x-oauth-basic@api.github.com/repos/tronxi/framework-educativo-eureka/git/refs/heads/develop version.json
RUN git clone https://${token}:x-oauth-basic@github.com/tronxi/framework-educativo-eureka.git
RUN cd framework-educativo-eureka && git checkout develop

FROM maven as builder
ARG clave
ENV clave_env ${clave}
COPY --from="git" /repo/framework-educativo-eureka .
RUN mvn package spring-boot:repackage -Dspring.profiles.active=dev

FROM openjdk:8-alpine
ARG clave
ENV clave_env ${clave}
ENV host_env defaultHost
COPY --from="builder" /target/framework-educativo-0.0.1-SNAPSHOT.jar .
CMD java -jar -Dspring.profiles.active=dev framework-educativo-0.0.1-SNAPSHOT.jar