
REPO=dronasys-com
ROS_APP=ros2
NAV_APP=nav2

BUILD_VER=a1.0.0

DOCKER_HUB_TAG=a1.0.0

build: ## build the ros2 + nav2 + gazebo container, with vnc via web
	@echo "====================> Building Ros2 + Nav2 Container"
	docker build --build-arg BUILD_VER=$(BUILD_VER) -t $(REPO)/$(NAV_APP) -f ros2.nav2.vnc.dockerfile .
	@echo "====================> Successfully build container: $(REPO)/$(NAV_APP)"


build-ros: ## build the ros2 container, with vnc via web
	@echo "====================> Building Ros2 Container"
	docker build --build-arg BUILD_VER=$(BUILD_VER) -t $(REPO)/$(ROS_APP) -f ros2.vnc.dockerfile .
	@echo "====================> Successfully build container: $(REPO)/$(ROS_APP)"
