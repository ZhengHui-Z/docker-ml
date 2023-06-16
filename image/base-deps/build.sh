#!/bin/bash

if [ $1 = "3.10" ]; then

    image='zhenghuiz/cuda:11.8.0-cudnn8-devel-ubuntu20.04-python3.10'
    docker build -t $image --build-arg PYTHON_VERSION=latest .
elif [ $1 = "3.9" ]; then
    image='zhenghuiz/cuda:11.8.0-cudnn8-devel-ubuntu20.04-python3.9'
    docker build -t $image --build-arg PYTHON_VERSION=py39_23.3.1-0 .
elif [ $1 = "3.8" ]; then
    image='zhenghuiz/cuda:11.8.0-cudnn8-devel-ubuntu20.04-python3.8'
    docker build -t $image --build-arg py38_23.1.0-1 .
else
    exit 1   
fi



if [ $?=0 ]; then
    echo "build success."
else
    echo "build failure."
    exit 1
fi

docker push $image

if [ $?=0 ]; then
    echo "push success."
else
    echo "push failure."
    exit 1
fi