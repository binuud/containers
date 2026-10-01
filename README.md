# containers

Collection of docker files, and aliases to launch containers for development and debug work.
Mounts the current working directory, so you can start using the tools, programming and build
from within the container.

Makes it easier for large teams to use the same tooling.

### Programming
* GoLang
* Angular

### Databases
* MongoDB

### Messaging
* MQTT Broker

### Robotics
* Ros2 with VNC
* Nav2 with VNC

### Build and deployment
* Wrangler

## Building docker images

cd in to the folder ( tool of your choice) and run make 
```
make
```
This command is common for all containers, if there are options during build process, the above command will output a list of options, instead of building

## Launch frequently used docker containers

Run the make command from the root of this project, to launch various containers.
```
make
```
Choose any of the target from the Makefile to launch the developemnt container of your choice.
Please do not use this for production.


* run-mongodb                    Start MongoDB Container
* run-mongo-shell                Start a mongo shell into the mongodb container, to test MongoDB
* run-mqtt                       Start MQTT Container - pub/sub broker
