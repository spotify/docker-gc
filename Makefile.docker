DOCKER_REPOSITORY ?= spotify/docker-gc
DOCKER_TAG ?= $(shell cat version.txt)

DOCKER ?= docker
export DOCKER

.PHONY: all image push

image:
	$(DOCKER) build -t $(DOCKER_REPOSITORY):$(DOCKER_TAG) .

push: image
	$(DOCKER) push $(DOCKER_REPOSITORY):$(DOCKER_TAG)
