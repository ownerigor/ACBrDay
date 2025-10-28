FROM ubuntu:22.04
RUN apt-get update -y && \
    apt-get dist-upgrade -y && \
    apt-get install -y curl && \
    apt-get autoclean -y && \
    apt-get autoremove -y
WORKDIR /usr/sbin/nfe
COPY ./Linux64/Debug/ ./
COPY ./Schemas ./Schemas
RUN chmod +x /usr/sbin/nfe/nfe_server
ARG PORT=9051
EXPOSE $PORT
ENTRYPOINT ["/usr/sbin/nfe/nfe_server"]

# To create a docker image
# docker build -t ownerigor/nfe_server .

# To create a container
# docker run -p 9051:9051 -d ownerigor/nfe_server