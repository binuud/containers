FROM golang:1.27.1-alpine

# Install git (required for some Go modules) and air
RUN apk update && apk add --no-cache git make bash
# RUN go install ://github.com

# Install reflex
RUN go install github.com/cespare/reflex@latest


WORKDIR /app


# Use Air as the entrypoint to watch for file changes
ENTRYPOINT ["bash"]