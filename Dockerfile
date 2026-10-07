# Minimal Docker image for DuckDB MIINT using Debian base
FROM debian:stable-slim

# install DuckDB MIINT
RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates libgomp1 wget && \
    wget -qO- "https://github.com/duckdb/duckdb/releases/download/v1.5.6/duckdb_cli-linux-amd64.gz" | gunzip > /usr/local/bin/duckdb && \
    chmod a+x /usr/local/bin/duckdb && \
    duckdb -c "INSTALL miint FROM community;"
