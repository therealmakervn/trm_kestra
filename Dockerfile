FROM eclipse-temurin:21-jre-jammy

WORKDIR /app

RUN groupadd kestra && \
    useradd -m -g kestra kestra

COPY --chown=kestra:kestra docker /

RUN mkdir -p /app/kestra /app/storage && \
    chown -R kestra:kestra /app

COPY --chown=kestra:kestra kestra /app/kestra/
RUN chmod +x /app/kestra/kestra

USER kestra

ENTRYPOINT ["/app/kestra/kestra"]
CMD ["server", "standalone"]
