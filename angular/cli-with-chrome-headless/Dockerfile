FROM node:24-alpine

# Install bash and git (git might be needed by Angular CLI)
RUN apk update && apk add --no-cache bash git

# Install Chromium for Karma tests (if using ChromeHeadless)
RUN apk add --no-cache chromium

# Set environment variables for headless Chrome
ENV CHROME_BIN=/usr/bin/chromium-browser
ENV PUPPETEER_SKIP_DOWNLOAD=true

WORKDIR /app

# Install latest Angular CLI globally
RUN npm install -g @angular/cli@latest

EXPOSE 4200
#COPY . .
#RUN npm i
# ENTRYPOINT ["npm"]