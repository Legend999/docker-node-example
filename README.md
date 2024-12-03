Steps to reproduce:

1. Build and run the container (everything works):
   ```bash
   docker compose up --build
   ```

2. Update the Dockerfile to skip optional dependencies during `npm install`:
   ```Dockerfile
   # RUN npm install # comment this line
   RUN npm install --omit=optional # uncomment this line
   ```

3. Stop and remove the container, images, and volumes, then rebuild (use the following commands to delete everything, or replace IDs to target specific ones):
   ```bash
   docker stop $(docker ps -q)
   docker rm $(docker ps -aq)
   docker rmi $(docker images -q)
   docker volume rm $(docker volume ls -q)

   docker compose up --build
   ```

4. The following error will show up:

    ``Error: Cannot find module @rollup/rollup-linux-x64-musl. npm has a bug related to optional dependencies (https://github.com/npm/cli/issues/4828). Please try `npm i` again after removing both package-lock.json and node_modules directory.``
