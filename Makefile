USERID := $(shell id -u $(USER))
USERNAME := $(shell id -un $(USER))
GROUPID := $(shell id -g $(USER))
GROUPNAME := $(shell id -gn $(USER))

all: build

build: build-devbox-base

build-devbox-base: devbox-base/Dockerfile
	echo $(USERID):$(GROUPID)
	docker build \
		--build-arg USERID=$(USERID) \
		--build-arg USERNAME=$(USERNAME) \
		--build-arg GROUPID=$(GROUPID) \
		--build-arg GROUPNAME=$(GROUPNAME) \
		-t devbox-base \
		devbox-base

