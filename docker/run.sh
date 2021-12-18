#!/bin/bash

xhost +local:docker > /dev/null || true

SERVICE_ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
SRV_NAME="$( basename $SERVICE_ROOT_DIR )"

IMG_NAME="$SRV_NAME"
CTR_NAME="$SRV_NAME"


if [ -n "$(which nvidia-smi)" ] && [ -n "$(nvidia-smi)" ]; then
    GPU_FLAG=(--gpus all)
else
    GPU_FLAG=""
fi


if [[ "$(docker images -q $IMG_NAME 2> /dev/null)" == "" ]]; then
    printf "\nBuilding image $IMG_NAME:\n\n"
    bash $SERVICE_ROOT_DIR/docker/build.sh -i $IMG_NAME
fi

# USER_ID=$(id -u)
# GROUP=$(id -g -n)
# GROUP_ID=$(id -g)

docker run  ${GPU_FLAG[@]} \
            -d -ti --rm \
            -e "DISPLAY" \
            -e "QT_X11_NO_MITSHM=1" \
            -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
            -e XAUTHORITY \
            -v /dev:/dev \
            -v $SERVICE_ROOT_DIR:/$SRV_NAME \
            --net=host \
            --ipc=host \
            --privileged \
            --name $CTR_NAME $IMG_NAME \
            > /dev/null

            # -e DOCKER_USER=$USER \
            # -e USER=$USER \
            # -e DOCKER_USER=$USER \
            # -e DOCKER_USER_ID=$USER_ID \
            # -e DOCKER_GROUP="$GROUP" \
            # -e DOCKER_GROUP_ID=$GROUP_ID \
            # -e DOCKER_IMG=$IMG \

# docker exec $CTR_NAME bash -c "${SERVICE_ROOT_DIR}/docker/scripts/adduser.sh"
