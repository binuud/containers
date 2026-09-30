# binu@dronasys.com


## 	STRICTLY FOLLOW
##	DO NOT USE THESE CONTAINERS FOR PRODUCTION


# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help vendor vendor-update
help: ## This help.
	@echo ""
	@echo "STRICTLY FOLLOW"
	@echo "DO NOT USE THESE CONTAINERS FOR PRODUCTION"
	@echo ""
	@echo "Targets to launch frequently used docker containers"
	@echo ""
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)



run-mongodb: ## Start MongoDB Container
# mongo:8 has an issue with linux kernel, where it does not start
# -e GLIBC_TUNABLES="glibc.pthread.rseq=0" 
# even with above workaround, mongo:8 does not start
# so using mongo:7, till above is fixed
	docker volume create mongo_data
	docker run --rm -d \
  --name mongodb \
  -p 27017:27017 \
  -e MONGO_INITDB_ROOT_USERNAME=admin \
  -e MONGO_INITDB_ROOT_PASSWORD=mongopass \
  -v mongo_data:/data/db \
  mongo:7

run-mongo-shell: ## Start a mongo shell into the mongodb container, to test MongoDB
	docker exec -it mongodb mongosh -u admin -p mongopass --authenticationDatabase admin	

run-mqtt: ## Start MQTT Container - pub/sub broker
	docker run --rm -d \
	--name MQTT \
	-v ./mqtt/mosquitto.conf:/mosquitto/config/mosquitto.conf \
	-p 1883:1883 \
	eclipse-mosquitto