# Wrangler container

Container name

```
dronasys-com/wrangler
```

## Useful commands

Authorize wrangler from within docker container, this is not needed if CLOUDFLARE_API_TOKEN is set in environment
```
/usr/local/bin/wrangler login --callback-host=0.0.0.0 --browser false
```

Deploy a directory
```
wrangler pages deploy ./public --project-name [PROJECT-name]
```

Check if Access token works fine with the following command
```
wrangler pages project list
```

## Example usage

```
## deploy  website via docker
#npx wrangler pages deploy ./src/public --project-name [PROJECT-name]
docker run --rm -it --name $(APP_NAME) -e CLOUDFLARE_API_TOKEN=$(CLOUDFLARE_API_TOKEN) -v ./src/:/app -p 8976:8976 $(WRANGLER_IMAGE)  pages deploy ./public --project-name [PROJECT-name]
```

```
## get shell access into wrangler container
docker run --rm -it --name $(APP_NAME) -e CLOUDFLARE_API_TOKEN=$(CLOUDFLARE_API_TOKEN) -v ./src:/app -p 8976:8976 --entrypoint /bin/sh $(WRANGLER_IMAGE)
```

Access token should have following permissions 
* [CloudFlare Token URL](https://dash.cloudflare.com/profile/api-tokens)
* Account.Cloudflare Pages Edit
* Account.Workers Scripts Edit
* User Memberships Read
* User User Details Read

In local.env use the following entry
```
CLOUDFLARE_API_TOKEN=[TOKEN-STRING]
```