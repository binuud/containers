
REPO=binuud
APP=golang

BUILD_VER=1.27.2

DOCKER_HUB_TAG=a1.0.0

build: ## build the golang container
	@echo "====================> Building Golang Container"
	docker build --build-arg BUILD_VER=$(BUILD_VER) -t $(REPO)/$(APP):$(BUILD_VER)  .
	@echo "====================> Successfully build container: $(REPO)/$(APP):$(BUILD_VER)"