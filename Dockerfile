# Gunakan image Maven dengan JDK 17
FROM maven:3.9.6-eclipse-temurin-17 AS build

# Set working directory
WORKDIR /app

# Copy semua file ke dalam container
COPY . .

# Build aplikasi menggunakan Maven
RUN mvn clean package -DskipTests

# Gunakan image runtime yang lebih ringan
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy hasil build dari stage sebelumnya
COPY --from=build /app/target/*.jar app.jar

# Jalankan aplikasi
CMD ["java", "-jar", "app.jar"]
