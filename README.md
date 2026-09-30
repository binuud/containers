# containers
Most used common containers, used during development work. 

## Building docker images

cd in to the path and run 
```
make
```
This command is common for all containers, if there are options during build process, the above command will output a list of options, instead of building

## Launch frequently used docker containers

```
make
```
Choose any of the target from the Makefile to launch the developemnt container of your choice.
Please do not use this for production.


* run-mongodb                    Start MongoDB Container
* run-mongo-shell                Start a mongo shell into the mongodb container, to test MongoDB
* run-mqtt                       Start MQTT Container - pub/sub broker