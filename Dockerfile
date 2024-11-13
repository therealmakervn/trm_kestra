FROM eclipse-temurin:21-jre-jammy

WORKDIR /app

RUN groupadd kestra && \
    useradd -m -g kestra kestra

COPY --chown=kestra:kestra docker /
COPY --chown=kestra:kestra build/executable/* /app/

RUN chmod +x /app/kestra && \
    chown -R kestra:kestra /app

USER kestra

ENTRYPOINT ["/app/kestra"]
CMD ["server", "standalone"]
