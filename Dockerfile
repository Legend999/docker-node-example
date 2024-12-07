FROM node:22-alpine

RUN npm install -g npm@latest # Fix bug in Node 22 Docker image with pre-installed npm version 10.9.0 (see: https://github.com/npm/cli/issues/7814)

USER node

WORKDIR /app

RUN mkdir -p ./node_modules && chown -R node:node ./node_modules

EXPOSE 5173

CMD ["sh", "-c", "npm install && npm run dev"]
