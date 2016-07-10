FROM alpine:latest
MAINTAINER Benjamin Fritsch <beanie@benle.de>

RUN apk add --update wget ca-certificates cron && rm -rf /var/cache/apk/*
RUN wget https://dl.eff.org/certbot-auto /usr/local/bin/certbot-auto
RUN chmod a+x /usr/local/bin/certbot-auto

RUN mkdir -p /certs/challenges

# Add crontab file in the cron directory
ADD crontab crontab.tmp

RUN crontab crontab.tmp && rm -rf crontab.tmp

ADD run_certbot.sh

CMD [/usr/sbin/crond, -f, -d, 0]
