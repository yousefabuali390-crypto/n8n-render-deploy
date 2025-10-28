FROM n8nio/n8n:latest

USER root

RUN apk add --no-cache bash curl

USER node

ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=admin123
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV WEBHOOK_URL=https://n8n-render-deploy.onrender.com
ENV N8N_EDITOR_BASE_URL=https://n8n-render-deploy.onrender.com
ENV GENERIC_TIMEZONE=Asia/Amman

EXPOSE 5678

CMD ["tini", "--", "n8n", "start"]
