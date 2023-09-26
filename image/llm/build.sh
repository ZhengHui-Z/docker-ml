#!/bin/bash


if [ $# -ne 2 ]; then
    echo "the number of input parameters cannot be less than 2 (PY_VERSION, FLASH_ATTEN_FLAG 0 or 1)."
    exit 1
fi
PY_VERSION=$1

if [ $2 -eq 1 ]; then
    echo "set FLASH_ATTEN_FLAG=1"
    FLASH_ATTEN_FLAG=1
    IMAGE="zhenghuiz/cuda:11.8.0-cudnn8-devel-ubuntu20.04-python${PY_VERSION}-llm-flash"
else
    echo "set FLASH_ATTEN_FLAG=0"
    FLASH_ATTEN_FLAG=0
    IMAGE="zhenghuiz/cuda:11.8.0-cudnn8-devel-ubuntu20.04-python${PY_VERSION}-llm"
fi

if [ $PY_VERSION = "3.10" ] || [ $PY_VERSION = "3.9" ] || [ $PY_VERSION = "3.8" ]; then
    echo "build 11.8.0-cudnn8-devel-ubuntu20.04-python${PY_VERSION}-llm"
    
    docker build --build-arg FLASH_ATTEN=$FLASH_ATTEN_FLAG --build-arg BASE_IMAGE=zhenghuiz/cuda:11.8.0-cudnn8-devel-ubuntu20.04-python$PY_VERSION -t $IMAGE .
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

