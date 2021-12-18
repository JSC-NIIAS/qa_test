#!/usr/bin/env bash

DOCKER_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SERVICE_ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
SRV_NAME="$( basename $SERVICE_ROOT_DIR )"


printf "\n"

BASE_IMG="debian:11.1"

printf "BUILD FROM: ${BASE_IMG}\n\n"

docker build -t $SRV_NAME -f $DOCKER_DIR/Dockerfile $DOCKER_DIR/.. \
                               --network=host \
                               --build-arg base_img=${BASE_IMG}
