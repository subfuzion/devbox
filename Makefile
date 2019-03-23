IMAGE := devbox
USERID := $(shell id -u $(USER))
USERNAME := $(shell id -un $(USER))
GROUPID := $(shell id -g $(USER))
GROUPNAME := $(shell id -gn $(USER))

build: Dockerfile
	echo $(USERID):$(GROUPID)
	docker build \
		--build-arg USERID=$(USERID) \
		--build-arg USERNAME=$(USERNAME) \
		--build-arg GROUPID=$(GROUPID) \
		--build-arg GROUPNAME=$(GROUPNAME) \
		-t ${IMAGE} \
		.

