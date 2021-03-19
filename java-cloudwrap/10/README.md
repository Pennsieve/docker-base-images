# Java Cloudwrap - JRE 10

## Build

This Dockerfile is intended to build a container using the latest
openjdk:10-jre-slim container with Cloudwrap. Unfortunately, Oracle isn't 
providing an alpine compatible JRE for Java 10/11 so we're working with 
Debian Slim for now.

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
