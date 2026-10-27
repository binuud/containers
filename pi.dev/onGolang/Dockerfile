FROM binuud/golang:1.27.1

## Install node and nodejs over golang

RUN apk update && apk add nodejs \
    npm 

## Install pi

RUN apk add  ca-certificates git ripgrep vim \
  && rm -rf /var/lib/apt/lists/*
RUN npm install -g --ignore-scripts @earendil-works/pi-coding-agent

COPY models.json /root/.pi/agent/models.json

WORKDIR /workspace

ENTRYPOINT ["pi"]