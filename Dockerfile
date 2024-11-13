FROM kestra/kestra:latest

USER root

# Tạo thư mục cần thiết
RUN mkdir -p /app/storage /tmp/kestra-wd/tmp /app/confs && \
    chown -R kestra:kestra /app /tmp/kestra-wd

# Copy file cấu hình
COPY application.yml /app/confs/
RUN chown kestra:kestra /app/confs/application.yml

USER kestra

ENV MICRONAUT_CONFIG_FILES=/app/confs/application.yml

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["server", "standalone"]
