# FROM openjdk:17.0.2-oraclelinux8

# WORKDIR /app

# COPY ./target/music-0.0.1-SNAPSHOT.jar /app

# EXPOSE 8080

# CMD ["java", "-jar", "music-0.0.1-SNAPSHOT.jar"]



####
FROM maven:3.8.1-openjdk-17-slim

WORKDIR /build

# Build dependency offline to streamline build
COPY pom.xml .
RUN mvn dependency:go-offline

COPY src src
RUN mvn package -Dmaven.test.skip=true

FROM openjdk:17.0.2-oraclelinux8
COPY --from=0 /build/target/music-0.0.1-SNAPSHOT.jar /app/target/music-0.0.1-SNAPSHOT.jar

EXPOSE 8081
ENTRYPOINT [ "java", "-jar", "/app/target/music-0.0.1-SNAPSHOT.jar", "--server.port=8081" ]