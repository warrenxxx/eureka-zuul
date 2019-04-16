FROM winamd64/openjdk:8u201-jdk-windowsservercore-1803 AS build
WORKDIR /app
COPY . .
RUN ./mvnw '-Dmaven.test.skip=true' package
EXPOSE 8761
#COPY --from=build /app/target/app.jar app.jar
#COPY target/app.jar app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dspring.profiles.active=production","-jar","target/app.jar"]