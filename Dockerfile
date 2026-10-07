# Minimal Docker image for DuckDB MIINT using Alpine base
FROM alpine:latest

# install DuckDB MIINT
RUN apk update && \
    apk add --no-cache bash libstdc++ && \
    wget -qO- "https://github.com/duckdb/duckdb/releases/download/v1.5.6/duckdb_cli-linux-amd64-musl.gz" | gunzip > /usr/local/bin/duckdb && \
    chmod a+x /usr/local/bin/duckdb && \
    duckdb -c "INSTALL miint FROM community;"
