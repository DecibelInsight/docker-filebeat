FROM alpine:3.7

ENV VERSION 5.4.2
ENV SHA256 28561df992f6caf2ac4592fca16d003c591cbeffeb438a59e61642ea8180b2da

RUN apk --update --no-cache add bash && \
    rm -rf /var/cache/apk/* && \
    wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-$VERSION-linux-x86_64.tar.gz -O filebeat-$VERSION-x86_64.tar.gz && \
    sha256sum filebeat-$VERSION-x86_64.tar.gz | grep $SHA256 && \
    mkdir filebeat-$VERSION-x86_64 && \
    tar xvf filebeat-$VERSION-x86_64.tar.gz -C filebeat-$VERSION-x86_64/ --strip-components=1 && \
    cp filebeat-$VERSION-x86_64/filebeat /filebeat && \
    cp filebeat-$VERSION-x86_64/filebeat.yml /filebeat.yml && \
    cp filebeat-$VERSION-x86_64/filebeat.template.json /filebeat.template.json && \
    cp filebeat-$VERSION-x86_64/filebeat.template-es2x.json /filebeat.template-es2x.json && \
    cp filebeat-$VERSION-x86_64/filebeat.template-es6x.json /filebeat.template-es6x.json && \
    rm -r filebeat-$VERSION-x86_64/ filebeat-$VERSION-x86_64.tar.gz

ENTRYPOINT ["/filebeat", "-e"]
