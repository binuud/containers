
REPO=binuud
APP=pi-dev-golang

BUILD_VER=1.0
DOCKER_HUB_TAG=v1.0

# MULTI_PLATFORM_DOCKER = --platform=linux/amd64,linux/arm64

build: ## build the pi-dev container
	@echo "====================> Building pi-dev Container"
#	docker build --build-arg BUILD_VER=$(BUILD_VER) $(MULTI_PLATFORM_DOCKER) -t $(REPO)/$(APP):$(BUILD_VER)  .
	docker build --build-arg BUILD_VER=$(BUILD_VER) -t $(REPO)/$(APP):$(BUILD_VER)  .
	@echo "====================> Successfully build container: $(REPO)/$(APP):$(BUILD_VER)"