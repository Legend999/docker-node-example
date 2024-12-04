Steps to reproduce:

1. Build and run the container (everything works):
   ```bash
   docker compose up --build
   ```

2. Remove significant dependencies from `package.json` e.g. `@vitejs/plugin-react`

3. Run `npm install` to update `package-lock.json`

4. Stop and remove the container, images, and volumes, then rebuild (use the following commands to delete everything, or replace IDs to target specific ones):
   ```bash
   docker stop $(docker ps -q)
   docker rm $(docker ps -aq)
   docker rmi $(docker images -q)
   docker volume rm $(docker volume ls -q)

   docker compose up --build
   ```

5. The following error will show up:

    ``Error [ERR_MODULE_NOT_FOUND]: Cannot find package '@vitejs/plugin-react' imported from /app/node_modules/.vite-temp/vite.config.ts.timestamp-1733299382139-6e1c72bf771df.mjs``

6. Add back the missing dependencies to `package.json` and run `npm install`

7. Build and run the container again:
   ```bash
   docker compose up --build
   ```

8. The app should work again (it is "the same" as in the beginning), but the error persists
