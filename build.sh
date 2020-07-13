#!/usr/bin/env bash

[[ -z "$REPOSITORY" ]] && REPOSITORY="maven3-base"
[[ -z "$REGISTRY" ]] && REGISTRY="aiwin"
[[ -z "$TAG" ]] && TAG="3.6-jdk-11"

# Build docker image
docker build -t $REGISTRY/$REPOSITORY:$TAG .

# Push image to registry
docker push $REGISTRY/$REPOSITORY:$TAG
