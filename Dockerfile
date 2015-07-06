FROM debian:jessie

ENV DOCKER_VERSION 1.6.2

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y python-minimal \
  && apt-get clean \
  && rm -rf /var/apt/lists/*

ADD https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION} /usr/local/bin/docker
RUN chmod +x /usr/local/bin/docker

ADD docker-gc /docker-gc

VOLUME /var/lib/docker-gc

CMD ["/docker-gc"]