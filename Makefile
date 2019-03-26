USERID := $(shell id -u $(USER))
USERNAME := $(shell id -un $(USER))
GROUPID := $(shell id -g $(USER))
GROUPNAME := $(shell id -gn $(USER))

BUILDTOOLS := devbox-base-buildtools
PARENT := devbox-parent
NODE := devbox-node

all: build

build: build-$(NODE)

build-$(BUILDTOOLS): $(BUILDTOOLS)/Dockerfile
	docker build \
		--build-arg USERID=$(USERID) \
		--build-arg USERNAME=$(USERNAME) \
		--build-arg GROUPID=$(GROUPID) \
		--build-arg GROUPNAME=$(GROUPNAME) \
		-t $(BUILDTOOLS) \
		$(BUILDTOOLS)

build-$(PARENT): build-$(BUILDTOOLS) $(PARENT)/Dockerfile
	echo "Building $(PARENT) using current user: $(USERNAME) ($(USERID):$(GROUPID))"
	docker build \
		-t $(PARENT) \
		$(PARENT)

build-$(NODE): build-$(PARENT) $(NODE)/Dockerfile
	docker build \
		--build-arg USERID=$(USERID) \
		--build-arg USERNAME=$(USERNAME) \
		--build-arg GROUPID=$(GROUPID) \
		--build-arg GROUPNAME=$(GROUPNAME) \
		-t $(NODE) \
		$(NODE)

