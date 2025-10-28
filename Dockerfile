FROM node:18-alpine

# Install dependencies
RUN apk add --no-cache \
    bash \
    curl \
    tini \
    python3 \
    make \
    g++ \
    su-exec

# Create node user and directory structure first
RUN adduser -D -u 1000 node && \
    mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node

# Switch to node user for npm installation
USER node

# Install n8n globally
RUN npm install -g n8n@latest

# Switch back to root for final setup
USER root

# Set environment variables
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=admin123
ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0
ENV WEBHOOK_URL=https://n8n-render-deploy.onrender.com
ENV N8N_EDITOR_BASE_URL=https://n8n-render-deploy.onrender.com
ENV N8N_PROTOCOL=https
ENV DB_TYPE=sqlite
ENV EXECUTIONS_PROCESS=main
ENV GENERIC_TIMEZONE=Asia/Amman
ENV N8N_DIAGNOSTICS_ENABLED=false
ENV N8N_SKIP_SETTINGS_FILE_PERMISSIONS_CHECK=true

EXPOSE 5678

# Use tini as init system and start n8n as node user
ENTRYPOINT ["/sbin/tini", "--", "su-exec", "node"]
CMD ["n8n", "start"]
