FROM node:22-alpine

RUN npm install -g npm@latest # Fix bug in Node 22 Docker image with pre-installed npm version 10.9.0 (see: https://github.com/npm/cli/issues/7814)

USER node

WORKDIR /app

COPY --chown=node:node package.json package-lock.json ./

RUN npm install

COPY . .

EXPOSE 5173

CMD ["npm", "run", "dev"]
