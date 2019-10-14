FROM alpine:3.9
# Set proxy for apt
RUN \
  apk add --update redis

FROM alpine:3.9
RUN \
  apk update && apk add --no-cache --update openssh-client gzip rsync curl bind-tools tcpdump mailx groff \
  mysql-client mongodb-tools postgresql-client \
  busybox busybox-extras grep bash jq git iputils netcat-openbsd nmap \
  vim python py-pip \
  && pip install elasticsearch-curator==5.4.0 awscli \
  && rm -rf /var/cache/apk/* /tmp/* /sbin/halt /sbin/poweroff /sbin/reboot

COPY --from=0 /usr/bin/redis-cli /usr/bin/

