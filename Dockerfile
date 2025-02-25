FROM docker.n8n.io/n8nio/n8n:latest

USER root
RUN chown -R node:node /usr/local/lib/node_modules/

RUN apk update && apk add --no-cache \
    chromium \
    nss \
    libxcomposite \
    libxdamage \
    libxrandr \
    mesa-gbm \
    alsa-lib \
    pango \
    cairo \
    gtk+3.0 \
    udev \
    ttf-freefont \
    && rm -rf /var/cache/apk/*

RUN npm install -g puppeteer \
    && npm install -g puppeteer-core \
    && npm cache clean --force

ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_ARGS="--no-sandbox --disable-setuid-sandbox"

USER node

EXPOSE 5678
