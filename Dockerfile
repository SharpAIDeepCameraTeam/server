FROM amazoncorretto:17

WORKDIR /app
COPY . .

RUN chmod +x server/server.sh
RUN chmod +x velocity/velocity.sh
RUN chmod +x limbo/limbo.sh

# Install supervisor to manage multiple processes
RUN apt-get update && apt-get install -y supervisor

# Create supervisor configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 25577

CMD ["/usr/bin/supervisord"]
