FROM node:8.11-alpine

COPY . /app

WORKDIR /app

RUN apk upgrade --update \
    && apk add bash git ca-certificates \
    && npm i npm@latest -g \
    && npm install -g bower \
    && npm --unsafe-perm --production install \
    && apk del git \
    && rm -rf /var/cache/apk/* \
        /app/.git \
        /app/screenshots \
        /app/test

EXPOSE 8888

VOLUME /app/kongadata

ENTRYPOINT ["/app/start.sh"]
