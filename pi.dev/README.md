# PI coding agent

Start the PI coding agent in a docker container, with model hosted on your local machine. 

Modify the models.json as per your convenience. And mount the same when starting the docker contianer
```
{
  "providers": {
    "mlx": {
      "baseUrl": "http://host.docker.internal:11234/v1",
      "api": "openai-completions",
      "apiKey": "mlx-serve",
      "compat": {
        "supportsDeveloperRole": false,
        "supportsReasoningEffort": true,
        "maxTokensField": "max_tokens"
      },
      "models": [
        {"id": "mlx-serve", "name": "mlx-mlx-serve", "input": ["text"],
        "contextWindow": 32768, "maxTokens": 8192, "reasoning": true,
        "thinkingLevelMap": {"off": "none"}}
      ]
    }
  }
}
```


Add the following alias, so you can cd into your code directory, and start the container, this will
mount the code into the workspace

```
alias container-pi-dev="docker run --rm -it -v .:/workspace -w /workspace binuud/pi-dev:1.0"
```

Mount your custom models.json file
```
docker run --rm -it -v .:/workspace -v  [PATH TO]models.json:/root/.pi/agent/models.json -w /workspace binuud/pi-dev:1.0
```