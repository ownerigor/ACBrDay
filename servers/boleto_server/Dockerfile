FROM ubuntu:22.04
RUN apt-get update -y && \
    apt-get dist-upgrade -y && \
    apt-get install -y curl && \
    apt-get autoclean -y && \
    apt-get autoremove -y
WORKDIR /usr/sbin/boleto
COPY ./Linux64/Debug/ ./
ARG PORT=9052
EXPOSE $PORT
ENTRYPOINT ["/usr/sbin/boleto/boleto_server"]

# To create a docker image
# docker build -t ownerigor/boleto_server .

# To create a container
# docker run -p 9052:9052 -d --name boleto_server ownerigor/boleto_server