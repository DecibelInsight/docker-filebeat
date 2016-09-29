FROM ubuntu:14.04

MAINTAINER Mike Christof <mhristof@gmail.com>

COPY filebeat-1.3.1-x86_64/filebeat /filebeat
COPY filebeat-1.3.1-x86_64/filebeat.yml /filebeat.yml


ENTRYPOINT ["/filebeat"]

#RUN apt-get update && apt-get install -y software-properties-common cabal-install
##RUN cabal update && cabal install shellcheck && ln -s ~/.cabal/bin/shellcheck /bin/shellcheck
