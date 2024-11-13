FROM kestra/kestra:latest

USER root

# Tạo thư mục cần thiết
RUN mkdir -p /app/storage /tmp/kestra-wd/tmp /app/confs && \
    chown -R kestra:kestra /app /tmp/kestra-wd

# Copy file cấu hình từ cli/src/main/resources
COPY cli/src/main/resources/application.yml /app/confs/
RUN chown kestra:kestra /app/confs/application.yml

USER kestra

# Sử dụng entrypoint script có sẵn
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["server", "standalone", "--worker-thread=128"]
