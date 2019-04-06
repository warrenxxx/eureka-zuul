FROM winamd64/openjdk:windowsservercore-1803 AS build
WORKDIR /app
COPY . .
RUN ./mvnw package
#
FROM openjdk:8-jdk-nanoserver AS run
EXPOSE 8760
WORKDIR /app
COPY --from=build /app/target/app.jar app.jar
#COPY target/app.jar app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dspring.profiles.active=production","-jar","app.jar"]
