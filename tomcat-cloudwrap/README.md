# Tomcat Cloudwrap - JRE 10

## Build

This Dockerfile is intended to build a container using the latest
tomcat:8-jre-alpine container with Cloudwrap.

1. Update the Cloudwrap version in `.env` and build the containers:  

    ``` bash
    docker-compose build
    ```

    Alternatively, pass the version via cli:

    ``` bash
    docker-compose build --build-arg CLOUDWRAP_VERSION=0.5.2
    ```

2. Push the containers to DockerHub:  

    ``` bash
    docker-compose push
    ```

## Usage

The container is built to be used as an executable with `cloudwrap` as the
entrypoint. Pass the appropriate command args to the container when
running it:

Eg. `docker run pennsieve/tomcat-cloudwrap:latest --environment dev --service api exec catalina.sh run`
