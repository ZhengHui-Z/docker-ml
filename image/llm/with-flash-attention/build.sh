#!/bin/bash


if [ $# = 1 ]; then
    PY_VERSION=$1
else
    echo "set PY_VERSION to 3.10."
    PY_VERSION="3.10"
fi


if [ $PY_VERSION = "3.10" ] || [ $PY_VERSION = "3.9" ] || [ $PY_VERSION = "3.8" ]; then
    echo "build 11.8.0-cudnn8-devel-ubuntu20.04-python${PY_VERSION}-llm-flash"
    IMAGE="zhenghuiz/cuda:11.8.0-cudnn8-devel-ubuntu20.04-python${PY_VERSION}-llm-flash"
    # --no-cache
    docker build --build-arg BASE_IMAGE=zhenghuiz/cuda:11.8.0-cudnn8-devel-ubuntu20.04-python$PY_VERSION -t $IMAGE .
else
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

