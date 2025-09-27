
NPM with angular CLI and chrome headless.

DO NOT USE THIS CONTAINER FOR DEPLOYMENT OR PRODUCTION

When running angular tests from withing containers, we need chrome headless.

There is no entrypoint for this container, so you can use "bash" as an argument to start bash shell

eg:

To start a bash shell, so you can run, npm commands or ng commands in the shell
```
docker run --rm  -it --name angular-cli-headless-chrome -v .:/app dronasys-com/angular-cli-headless-chrome bash
```

To start a npm script, script entries can be in package.json
```
docker run --rm  -it --name angular-cli-headless-chrome -v .:/app dronasys-com/angular-cli-headless-chrome npm start
```

To start a npm test
```
docker run --rm  -it --name angular-cli-headless-chrome -v .:/app dronasys-com/angular-cli-headless-chrome npm test
```

To start a npm build
```
docker run --rm  -it --name angular-cli-headless-chrome -v .:/app dronasys-com/angular-cli-headless-chrome npm build
```

To exec into the shell
```
docker exec -it angular-cli-headless-chrome brain-ui bash
```