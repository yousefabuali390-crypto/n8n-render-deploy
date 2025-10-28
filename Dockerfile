FROM node:18-alpine

# Install n8n and create user
RUN adduser -D -u 1000 n8nuser && \
    npm install -g n8n@latest

# Switch to n8n user
USER n8nuser

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

CMD ["n8n", "start"]
