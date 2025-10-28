FROM node:18-alpine

RUN npm install -g n8n --unsafe-perm=true

ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=admin123
ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=http
ENV GENERIC_TIMEZONE=Asia/Amman

EXPOSE 5678

CMD ["/usr/local/bin/n8n", "start"]
