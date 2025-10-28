FROM n8nio/n8n:latest

# Install additional dependencies that might be missing
RUN apk add --no-cache \
    bash \
    curl

# Set environment variables
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=admin123
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV WEBHOOK_URL=https://n8n-render-deploy.onrender.com
ENV N8N_EDITOR_BASE_URL=https://n8n-render-deploy.onrender.com
ENV GENERIC_TIMEZONE=Asia/Amman

# Create n8n data directory
RUN mkdir -p /home/node/.n8n

# Fix permissions
RUN chown -R node:node /home/node/.n8n

# Switch to node user
USER node

# Expose the port
EXPOSE 5678

# Start n8n
CMD ["n8n", "start"]
