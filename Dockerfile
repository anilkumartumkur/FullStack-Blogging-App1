FROM eclipse-temurin:17-jdk-alpine

EXPOSE 8080

ENV APP_HOME /usr/src/app

# Add a deliberately vulnerable package
RUN apk add --no-cache curl=7.67.0-r0  # Old version with known CVEs

COPY target/*.jar $APP_HOME/app.jar

WORKDIR $APP_HOME

CMD ["java", "-jar", "app.jar"]

