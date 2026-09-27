
REPO=dronasys-com
APP=wrangler

BUILD_VER=a1.0.0

DOCKER_HUB_TAG=a1.0.0

build: ## build the wrangler image
	@echo "====================> Building Angular Container"
	docker build --build-arg BUILD_VER=$(BUILD_VER) -t $(REPO)/$(APP)  .
	@echo "====================> Successfully build container: $(REPO)/$(APP) ."