#!/bin/bash

docker-compose build --no-cache | tee output.txt

IMAGE_TAG=$(grep CLAMAV_VERSION output.txt | grep -v RUN | awk -F= '{print $2}' | sed 's/\//-/g')

if [ ! -z "$IMAGE_TAG" ]; then
  docker tag pennsieve/clamav pennsieve/clamav:$IMAGE_TAG
  docker push pennsieve/clamav:$IMAGE_TAG
fi 
