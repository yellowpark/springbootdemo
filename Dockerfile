# FROM registry.access.redhat.com/ubi8/openjdk-17
# USER 1001
# COPY target/springbootdemo-0.0.1-SNAPSHOT.jar springbootdemo-0.0.1-SNAPSHOT.jar
# #ENTRYPOINT ["java","-jar","/springbootdemo-0.0.1-SNAPSHOT.jar"]

# EXPOSE 8080
# CMD ["java", "-jar", "springbootdemo-0.0.1-SNAPSHOT.jar"]

# FROM openjdk:17-jdk-slim-buster
# WORKDIR /app

# # COPY app/build/lib/* build/lib/

# COPY target/springbootdemo-0.0.1-SNAPSHOT.jar build/springbootdemo-0.0.1-SNAPSHOT.jar

# WORKDIR /app/build
# ENTRYPOINT java -jar springbootdemo-0.0.1-SNAPSHOT.jar



FROM maven:3.8.5-openjdk-17-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml -Pnative clean package

FROM openjdk:17-oracle
COPY --from=build /home/app/target/springbootdemo-*.jar /usr/local/lib/springbootdemo.jar
ENTRYPOINT ["java", "-jar", "/usr/local/lib/springbootdemo.jar"]