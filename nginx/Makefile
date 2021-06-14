NS = dvin
VERSION ?= 1.0.1

REPO = nginx

build:
	docker build -t $(NS)/$(REPO):$(VERSION) .

push:
	docker push $(NS)/$(REPO):$(VERSION)
