FROM alpine:3.10

ENV DOCKER_VERSION 17.09.0-ce

RUN apk --no-cache add bash \
  && cd /tmp/ \
  && wget -q https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz \
  && tar zxf docker-${DOCKER_VERSION}.tgz \
  && mv $(find -name 'docker' -type f) /usr/local/bin/ \
  && rm -rf /tmp/*

COPY ./docker-gc /docker-gc

VOLUME /var/lib/docker-gc

CMD ["/docker-gc"]
