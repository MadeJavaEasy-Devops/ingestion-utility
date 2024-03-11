FROM openjdk:17-jdk-slim
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} ingestion-utility.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "ingestion-utility.jar"]
