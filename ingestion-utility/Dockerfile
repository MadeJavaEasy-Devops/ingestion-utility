FROM eclipse-temurin:17-jdk-jammy
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} ingestion-utility.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "ingestion-utility.jar"]
