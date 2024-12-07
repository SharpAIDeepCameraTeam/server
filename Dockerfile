FROM ubuntu:22.04

# Install Java and supervisor
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk supervisor && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

# Make scripts executable and fix permissions
RUN chmod +x server/server.sh velocity/velocity.sh limbo/limbo.sh && \
    mkdir -p /var/log/supervisor /var/run/supervisor && \
    chmod -R 777 /app

# Create supervisor configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose ports
EXPOSE 80 8000

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
