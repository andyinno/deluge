FROM resin/rpi-raspbian:jessie
MAINTAINER Andrea Innocenti <andyinno@gmail.com>

RUN apt-get update &&\
    apt-get install -y \
      deluged \
      deluge-webui \ 
      deluge-console && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN adduser --system -u 1000 deluge
EXPOSE 58846 8112

VOLUME /config
VOLUME /data

COPY init.sh /init.sh
CMD ["/init.sh"]
