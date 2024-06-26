#!/bin/bash

export http_proxy=http://192.168.36.20:11087
export https_proxy=http://192.168.36.20:11087

if [ $# = 1 ]; then
    PY_VERSION=$1
else
    echo "set PY_VERSION to 310."
    PY_VERSION="310"
fi

DATE=$(date +"%Y%m%d")

if [ $PY_VERSION = "310" ] || [ $PY_VERSION = "39" ] || [ $PY_VERSION = "38" ]; then
    IMAGE="zhenghuiz/cuda:11.8.0-cudnn8-devel-ubuntu20.04-py${PY_VERSION}-vllm-${DATE}"
    echo "${IMAGE}"
    # --no-cache
    docker build --build-arg BASE_IMAGE=zhenghuiz/cuda:11.8.0-cudnn8-devel-ubuntu20.04-py$PY_VERSION-llm -t $IMAGE .
else
    echo "PY_VERSION must be set to 310 | 39 | 38";
    exit 1   
fi

if [ $? -eq 0 ]; then
    echo "build success. starting push ${image} "
    
    docker push $IMAGE

    if [ $? -eq 0 ]; then
        echo "push success."
    else
        echo "push failure."
        exit 1
    fi
else
    echo "build failure."
    exit 1
fi
