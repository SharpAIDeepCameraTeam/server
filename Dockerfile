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

# Expose port 8000 for Koyeb and 25577 for Minecraft
EXPOSE 8000 25577

# Set environment variable for the port
ENV PORT=8000

CMD ["/usr/bin/supervisord"]
