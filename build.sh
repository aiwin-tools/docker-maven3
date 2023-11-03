#!/usr/bin/env bash

[[ -z "$REPOSITORY" ]] && REPOSITORY="maven3-base"
[[ -z "$REGISTRY" ]] && REGISTRY="aiwin"
[[ -z "$TAG" ]] && TAG="latest"

# Build docker image
docker build --rm -t $REGISTRY/$REPOSITORY:$TAG .

# Push image to registry
docker push $REGISTRY/$REPOSITORY:$TAG
