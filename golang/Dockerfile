FROM golang:1.27.1-alpine

# Install necessary system dependencies for protoc
RUN apk update && apk add --no-cache git make bash curl \
    unzip \
    protobuf \
    protobuf-dev \
    yq 


# Install the latest stable version of gopls, reflex and proto buffer
# goreleaser, is used to build variants of go binary for darwin, linux and windows
RUN go install github.com/cespare/reflex@latest \
    && go install golang.org/x/tools/gopls@latest \
    && go install google.golang.org/protobuf/cmd/protoc-gen-go@latest \
    && go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest \
    && go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@latest \
    && go install github.com/grpc-ecosystem/protoc-gen-grpc-gateway-ts@latest \
    && go install github.com/ogen-go/protoc-gen-oas/cmd/protoc-gen-oas@latest \
    && go install github.com/goreleaser/goreleaser/v2@latest

# Copy tooling scripts, to add autocomplete for make and other functions
COPY ./tooling.sh /etc/bash/tooling.sh

WORKDIR /app


# Use Air as the entrypoint to watch for file changes
ENTRYPOINT ["bash"]