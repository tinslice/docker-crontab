FROM tinslice/supervisord:1.1

RUN apk add --update --no-cache bash && \
    mkdir -p /opt/cron

COPY fs/opt/cron/ /opt/cron/

RUN chmod +x /opt/cron/*.sh

ADD fs/etc/supervisord.d/* /etc/supervisord.d/