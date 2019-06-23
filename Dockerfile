FROM alpine:3.10

ENV DOCKER_VERSION 18.09.6

RUN apk --no-cache add bash \
  && wget -q https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz \
  && tar zxf docker-${DOCKER_VERSION}.tgz \
  && mv docker/docker /usr/local/bin/ \
  && rm -rf docker/ docker-${DOCKER_VERSION}.tgz

COPY ./docker-gc /docker-gc

VOLUME /var/lib/docker-gc

CMD ["/docker-gc"]
