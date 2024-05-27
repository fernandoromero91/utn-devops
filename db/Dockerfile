FROM mongo:latest

ENV MONGO_INITDB_ROOT_USERNAME=root
ENV MONGO_INITDB_ROOT_PASSWORD=yari

COPY script.js /docker-entrypoint-initdb.d/
