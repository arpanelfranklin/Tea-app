# Use Gradle 9 with Java 25 for the build stage
# Note: gradle:9-jdk25 is the specific image for Java 25 support
FROM gradle:9-jdk25 AS builder
WORKDIR /app

# Copy only the configuration files first
COPY build.gradle settings.gradle ./
RUN gradle dependencies --no-daemon

# Copy the source code and build
COPY src ./src
RUN gradle bootJar --no-daemon

# Final runtime stage using Java 25
# eclipse-temurin:25 is the recommended runtime for Java 25
FROM eclipse-temurin:25-jre-jammy
WORKDIR /app

# Copy the jar from the builder stage
COPY --from=builder /app/build/libs/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]