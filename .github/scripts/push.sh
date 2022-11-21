#!/bin/bash

HASH=$(date --iso-8601=minutes) | sha1sum | head -c 40
SHORT_HASH=$(echo $HASH | cut -c1-8)

docker build -f Dockerfile . $IMAGE:latest

docker tag $IMAGE:latest $IMAGE:$HASH
docker tag $IMAGE:latest $IMAGE:$SHORT_HASH

docker push $IMAGE:latest
docker push $IMAGE:$HASH
docker push $IMAGE:$SHORT_HASH
