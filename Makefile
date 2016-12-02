#
# Makefile
# vagrant, 2016-07-24 12:42
#

.PHONY=download
VERSION=5.0.1
SHA1=b8139a51834f6c0ff90a7de1159c0b2162b86e7e
NAME=mspanakis/filebeat

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

download: filebeat-$(VERSION)-x86_64.tar.gz filebeat-$(VERSION)-x86_64

filebeat-$(VERSION)-x86_64:
	mkdir filebeat-$(VERSION)-x86_64
	tar xvf filebeat-$(VERSION)-x86_64.tar.gz -C filebeat-$(VERSION)-x86_64/ --strip-components=1

filebeat-$(VERSION)-x86_64.tar.gz:
	wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-$(VERSION)-linux-x86_64.tar.gz -O filebeat-$(VERSION)-x86_64.tar.gz
	openssl sha1 filebeat-$(VERSION)-x86_64.tar.gz | grep $(SHA1)

clean:
	rm -rf filebeat-$(VERSION)-x86_64*

all:
	@echo "Makefile needs your attention"


# vim:ft=make
#
