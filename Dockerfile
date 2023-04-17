FROM openjdk:17.0.2-oraclelinux8

WORKDIR /app

COPY ../target/music-0.0.1-SNAPSHOT.jar /app

EXPOSE 8080

CMD ["java", "-jar", "music-0.0.1-SNAPSHOT.jar"]