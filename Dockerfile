FROM kestra/kestra:latest

USER root

# Tạo thư mục cần thiết
RUN mkdir -p /app/storage /tmp/kestra-wd/tmp && \
    chown -R kestra:kestra /app /tmp/kestra-wd

USER kestra

# Sử dụng entrypoint script có sẵn
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["server", "standalone"]
