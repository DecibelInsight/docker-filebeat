FROM ubuntu:14.04

MAINTAINER Mike Christof <mhristof@gmail.com>

COPY filebeat-5.0.1-x86_64/filebeat /filebeat
COPY filebeat-5.0.1-x86_64/filebeat.yml /filebeat.yml
COPY filebeat-5.0.1-x86_64/filebeat.template.json /filebeat.template.json


ENTRYPOINT ["/filebeat", "-e"]
