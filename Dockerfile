FROM alpine:latest
MAINTAINER Patrick Gremo <patrick.gremo@gmail.com>

RUN apk --no-cache add bash curl dnsmasq docker

RUN mkdir -p /etc/dnsmasq.d

COPY dnsmasq.conf /etc/dnsmasq.conf
COPY run.sh /run.sh

ENV DNS_DOMAIN="dev"
ENV EXTRA_HOSTS=""
ENV HOSTMACHINE_IP="172.17.0.1"

EXPOSE 53/udp

ENTRYPOINT ["/run.sh"]
