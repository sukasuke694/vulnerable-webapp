# Gunakan base image OpenJDK 17
FROM openjdk:17-jdk-slim

# Set direktori kerja di dalam container
WORKDIR /app

# Copy semua file dari repository ke dalam container
COPY . .

# Beri izin eksekusi ke mvnw (Maven Wrapper)
RUN chmod +x mvnw

# Build aplikasi menggunakan Maven
RUN ./mvnw clean package -DskipTests

# Set perintah default untuk menjalankan aplikasi
CMD ["java", "-jar", "target/vulnerable-webapp-1.0-SNAPSHOT.jar"]
