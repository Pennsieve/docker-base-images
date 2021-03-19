# Node 8 Cloudwrap 

## Build

This Dockerfile is intended to build a container using the latest
node:8-alpine container with Cloudwrap.

1. Update the Cloudwrap version in `.env` and build the containers:  

    ``` bash
    docker-compose build
    ```

    Alternatively, pass the version via cli:

    ``` bash
    docker-compose build --build-arg CLOUDWRAP_VERSION=0.5.5
    ```

2. Push the containers to DockerHub:  

    ``` bash
    docker-compose push
    ```
