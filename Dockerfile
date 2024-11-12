FROM kestra/kestra:latest

# Thiết lập working directory
WORKDIR /app

# Thiết lập các biến môi trường cần thiết
ENV KESTRA_CONFIGURATION=/app/application.yml \
    PORT=8080

# Copy file cấu hình nếu có
COPY application.yml /app/application.yml

# Expose port
EXPOSE 8080

# Khởi chạy Kestra server
ENTRYPOINT ["kestra", "server", "standalone"]
