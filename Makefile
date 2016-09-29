#
# Makefile
# vagrant, 2016-07-24 12:42
#

.PHONY=download
VERSION=1.3.1
NAME=mhristof/filebeat

default: build

tag:
	docker tag $(NAME) $(NAME):$(VERSION)
	docker tag $(NAME) $(NAME):latest
	git tag $(VERSION)

push:
	git push --tags
	docker push $(NAME):$(VERSION)
	docker push $(NAME):latest

build:
	docker build -t $(NAME) .

download: filebeat-1.3.1-x86_64.tar.gz filebeat-1.3.1-x86_64

filebeat-1.3.1-x86_64:
	tar xvf filebeat-1.3.1-x86_64.tar.gz

filebeat-1.3.1-x86_64.tar.gz:
	wget https://download.elastic.co/beats/filebeat/filebeat-1.3.1-x86_64.tar.gz -O filebeat-1.3.1-x86_64.tar.gz
	openssl sha1 filebeat-1.3.1-x86_64.tar.gz | grep 693c04e2251498e73436cfc2b36a3a0aec920a2d

clean:
	rm -rf filebeat-1.3.1-x86_64*

all:
	@echo "Makefile needs your attention"


# vim:ft=make
#
