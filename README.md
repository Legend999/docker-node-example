# Docker Node example:

### Build and run the container:
   ```bash
   docker compose up --build
   ```

### Full Docker cleanup:
   ```bash
   docker stop $(docker ps -q)
   docker system prune --all --volumes --force
   ```
