FROM ubuntu:22.04

# Install Java and supervisor
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk supervisor && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

RUN chmod +x server/server.sh
RUN chmod +x velocity/velocity.sh
RUN chmod +x limbo/limbo.sh

# Create supervisor configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose both HTTP and WebSocket ports
EXPOSE 80 443 25577

CMD ["/usr/bin/supervisord"]
