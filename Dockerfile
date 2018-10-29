FROM ubuntu:xenial



RUN apt-get update &&\
    apt-get -y install apt-mirror  cron &&\
    DEBIAN_FRONTEND=noninteractive apt-get -y install proftpd-basic &&\
    apt autoremove -y && apt clean && rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/* 

COPY docker-entrypoint.sh /
COPY mirror.list /etc/apt/mirror.list
COPY anonymous.conf /etc/proftpd/conf.d/anonymous.conf
COPY proftpd.conf /etc/proftpd/proftpd.conf

VOLUME ["/var/spool/apt-mirror"]

RUN echo "0 4 * * * root /usr/bin/apt-mirror > /var/spool/apt-mirror/cron.log" >> /etc/cron.d/apt-mirror

RUN chmod +x docker-entrypoint.sh
CMD ["docker-entrypoint.sh"]