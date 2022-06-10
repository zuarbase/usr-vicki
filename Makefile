# This Makefile is just a convenience.  It is not an essential part
# of the example documentation repo.


LOCAL_IMAGE := zmkdocs:latest
ECR_REPO := public.ecr.aws/zuar
ECR_IMAGE := $(ECR_REPO)/zmkdocs:latest


################################################################################
# work with images built locally
#

# run a local image (not from ECR) to serve content
local-serve:
	cd docs; docker run --rm -it -p 8000:8000 -v `pwd`:/docs $(LOCAL_IMAGE)
.PHONY: local-serve

# run a local image (not from ECR) to build content
local-build:
	cd docs; docker run --rm -it -p 8000:8000 -v `pwd`:/docs $(LOCAL_IMAGE) mkdocs build
.PHONY: local-build

################################################################################
# work with images from ECR
#

# pull an image from ECR
pull:
	docker pull $(ECR_IMAGE)
.PHONY: pull

# run an image from ECR to serve content
serve:
	cd docs; docker run --rm -it -p 8000:8000 -v `pwd`:/docs $(ECR_IMAGE)
.PHONY: serve

# run an image from ECR to build content
build:
	cd docs; docker run --rm -it -p 8000:8000 -v `pwd`:/docs $(ECR_IMAGE) mkdocs build
.PHONY: build

# login to Zuar's Docker ECR
docker-login:
	aws ecr-public get-login-password | docker login --username AWS --password-stdin $(ECR_REPO)
.PHONY: docker-login

clean:
	rm -rf docs/site
.PHONY: clean
