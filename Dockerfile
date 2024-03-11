FROM openjdk:17-jdk-slim
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} ingestion-utility-0.0.1.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "ingestion-utility-0.0.1.jar"]
