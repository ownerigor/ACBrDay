FROM ubuntu:22.04
RUN apt-get update -y && \
    apt-get dist-upgrade -y && \
    apt-get install -y curl && \
    apt-get autoclean -y && \
    apt-get autoremove -y
WORKDIR /usr/sbin/principal
COPY ./Linux64/Debug/ ./
COPY ./Schemas ./Schemas
RUN chmod +x /usr/sbin/principal/principal_server
ARG PORT=9051
EXPOSE $PORT
ENTRYPOINT ["/usr/sbin/principal/principal_server"]

# To create a docker image
# docker build -t ownerigor/principal_server .

# To create a container
# docker run -p 9051:9051 -d ownerigor/principal_server