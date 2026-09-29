# Golang 1.27.1

Golang1.27.1 alpine with bash, reflex and make

### Sample
```
docker run --rm -v $(pwd):/app -w /app --it dronasys-com/golang:1.27.1 bash
docker run --rm -v $(pwd):/app -w /app --it dronasys-com/golang:1.27.1 bash -c "go install ://github.com && air init"
```

### Usage
Add the following in your .bashrc or .zshrc file
```
# launch a golang container
golang() {
  docker run --rm -v $(pwd):/app -w /app -it dronasys-com/golang:1.27.1
}
```

Now if you run the following command, it will open a shell into golang container, you can use make tools, go run commands from within here, reflex is preinstalled for checking code changes
```
golang
```