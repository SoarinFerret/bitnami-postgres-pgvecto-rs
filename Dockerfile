ARG PGVECTORS_TAG=pg14-v0.1.13-amd64
ARG BITNAMI_TAG=14.5.0-debian-11-r6
FROM scratch as nothing
FROM tensorchord/pgvecto-rs-binary:pg14-v0.1.13-amd64 as binary

FROM docker.io/bitnami/postgresql:${BITNAMI_TAG}
COPY --from=binary /pgvecto-rs-binary-release.deb /tmp/vectors.deb
USER root
RUN apt-get install -y /tmp/vectors.deb && rm -f /tmp/vectors.deb && mv /usr/lib/postgresql/*/lib/vectors.so /opt/bitnami/postgresql/lib/
USER 1001
ENV POSTGRESQL_EXTRA_FLAGS="-c shared_preload_libraries=vectors.so"