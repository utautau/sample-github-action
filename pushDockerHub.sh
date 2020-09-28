#!/bin/sh
export DOCKER_IMAGE=sample-action
export IMAGE_VERSION=1.0.1
export DOCKER_REPOSITORY=outautauo

echo "DOCKER IMAGE=${DOCKER_IMAGE}"
echo "IMAGE_VERSION=${IMAGE_VERSION}"

# Build docker image.
cd test-sh
docker build -t ${DOCKER_IMAGE}:${IMAGE_VERSION} .
docker tag ${DOCKER_IMAGE}:${IMAGE_VERSION} ${DOCKER_REPOSITORY}/${DOCKER_IMAGE}:${IMAGE_VERSION}

# Push docker image.
docker login -u ${DOCKER_USER} -p ${DOCKER_PASS}
docker push ${DOCKER_REPOSITORY}/${DOCKER_IMAGE}:${IMAGE_VERSION}
