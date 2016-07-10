FROM alpine:latest
MAINTAINER Benjamin Fritsch <beanie@benle.de>

RUN apk add --update certbot && rm -rf /var/cache/apk/*

RUN mkdir -p /certs/challenges

# Add crontab file in the cron directory
ADD crontab crontab.tmp

RUN crontab crontab.tmp && rm -rf crontab.tmp

ADD run_certbot.sh run_certbot.sh

CMD ["crond", "-f", "-d", "0"]
