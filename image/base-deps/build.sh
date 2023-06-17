#!/bin/bash

if [ $1 = "3.10" ]; then
    echo "build 11.8.0-cudnn8-devel-ubuntu20.04-python3.10"
    image='zhenghuiz/cuda:11.8.0-cudnn8-devel-ubuntu20.04-python3.10'
    docker build --build-arg PYTHON_VERSION=latest -t $image .
elif [ $1 = "3.9" ]; then
    echo "build 11.8.0-cudnn8-devel-ubuntu20.04-python3.9"
    image='zhenghuiz/cuda:11.8.0-cudnn8-devel-ubuntu20.04-python3.9'
    docker build --build-arg PYTHON_VERSION=py39_23.3.1-0 -t $image .
elif [ $1 = "3.8" ]; then
    echo "build 11.8.0-cudnn8-devel-ubuntu20.04-python3.8"
    image='zhenghuiz/cuda:11.8.0-cudnn8-devel-ubuntu20.04-python3.8'
    docker build --build-arg PYTHON_VERSION=py38_23.1.0-1 -t $image .
else
    exit 1   
fi



if [ $? -eq 0 ]; then
    echo "build success."
else
    echo "build failure."
    exit 1
fi

docker push $image

if [ $? -eq 0 ]; then
    echo "push success."
else
    echo "push failure."
    exit 1
fi