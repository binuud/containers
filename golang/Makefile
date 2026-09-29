
REPO=dronasys-com
APP=golang:1.27.1

BUILD_VER=a1.0.0

DOCKER_HUB_TAG=a1.0.0

build: ## build the golang container
	@echo "====================> Building Golang Container"
	docker build --build-arg BUILD_VER=$(BUILD_VER) -t $(REPO)/$(APP)  .
	@echo "====================> Successfully build container: $(REPO)/$(APP)"