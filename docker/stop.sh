#!/bin/bash

SERVICE_ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
SRV_NAME="$( basename $SERVICE_ROOT_DIR )"

docker stop $SRV_NAME > /dev/null
