FROM maven:3.5-jdk-8-alpine as builder

WORKDIR /app
COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests
FROM openjdk:8-jre-alpine
COPY --from=builder /app/target/testjava-*.jar /testjava.jar
CMD ["java", "-jar", "/testjava.jar"]