FROM ubuntu:14.04

MAINTAINER Mike Christof <mhristof@gmail.com>

ARG VERSION

COPY filebeat-${VERSION}-x86_64/filebeat /filebeat
COPY filebeat-${VERSION}-x86_64/filebeat.yml /filebeat.yml
COPY filebeat-${VERSION}-x86_64/filebeat.template.json /filebeat.template.json


ENTRYPOINT ["/filebeat", "-e"]
