FROM node:18-alpine

# Install dependencies
RUN apk add --no-cache \
    bash \
    curl \
    tini \
    python3 \
    make \
    g++

# Install n8n globally
RUN npm install -g n8n

# Create app directory and set permissions
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node

# Switch to node user
USER node

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

EXPOSE 5678

# Use tini as init system
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["n8n", "start"]
