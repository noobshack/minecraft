.PHONY: init build tag push

GIT_HASH := $(shell git rev-parse --short HEAD)
GIT_BRANCH := $(shell git rev-parse --abbrev-ref HEAD)

SERVICE := "minecraft"
IMAGE := "gcr.io/noobshack-164103/$(SERVICE)"

default: tag

build:
	docker build --pull --no-cache --build-arg GIT_HASH=$(GIT_HASH) -t $(IMAGE):$(GIT_HASH) .

tag: 
	docker tag $(IMAGE):$(GIT_HASH) $(IMAGE):latest

push: clean tag
	docker push $(IMAGE):latest
	docker push $(IMAGE):$(GIT_HASH)
