FROM alpine:latest
MAINTAINER aeternus <aeternus@aliyun.com>

RUN set -ex \
  \
  ## add repo for docker-cli
  && echo "http://dl-cdn.alpinelinux.org/alpine/latest-stable/community" >>/etc/apk/repositories \
  \
  ## install git, docker-cli
  && apk add --no-cache \
      git \
      docker-cli \
  \
  && rm -rf /tmp/*
