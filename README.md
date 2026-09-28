# Docker Base Images

Dockerfiles for Docker base images.

## Prerequisites

- [Docker](https://docs.docker.com/installation/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Building an Image

Issue the following from the directory foto build and push a new image:

To test a new image, say `go-cloudwrap/alpine` issue the following from the root of this repo:

```
cd go-cloudwrap/alpine
docker compose build
```

To build and push a new image, run the Jenkins job **Operations > build-docker-base-image**
by choosing "Build with Parameters" and entering the directory of the image you want to create.

Or you can build and push locally by issuing the following if you have the correct permissions (using the `sbt` image as
an example):

```
cd sbt
docker compose build
docker compose push
```
