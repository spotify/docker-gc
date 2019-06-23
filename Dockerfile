FROM library/docker:17.09.0-ce

RUN apk --update add bash

COPY ./docker-gc /docker-gc

VOLUME /var/lib/docker-gc

CMD ["/docker-gc"]
