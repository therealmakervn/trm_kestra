FROM kestra/kestra:latest

# Sử dụng user root để có quyền thực thi
USER root

# Tạo các thư mục cần thiết
RUN mkdir -p /app/storage /tmp/kestra-wd/tmp && \
    chown -R kestra:kestra /app /tmp/kestra-wd

# Chuyển về user kestra
USER kestra

# Command để chạy kestra server
CMD ["server", "standalone"]
