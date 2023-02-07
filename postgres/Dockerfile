FROM postgres:12.13

ENV POSTGIS_MAJOR 3
ENV POSTGRES_USER postgres
ENV POSTGRES_PASS postgres

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    postgresql-12-postgis-$POSTGIS_MAJOR \
    postgresql-12-postgis-scripts \
    && rm -rf /var/lib/apt/lists/*

# cleanup
RUN apt-get -qy autoremove

RUN mkdir -p /docker-entrypoint-initdb.d