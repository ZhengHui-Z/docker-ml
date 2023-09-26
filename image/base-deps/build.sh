#!/bin/bash

if [ $# -ne 1 ]; then
    echo "missing argument PY_VERSION, defaulting to python3.10.";
    PY_VERSION='3.10';
else
    PY_VERSION=$1;
fi


if [ $PY_VERSION = "3.10" ] || [ $PY_VERSION = "3.9" ] || [ $PY_VERSION = "3.8" ]; then
    echo "build 11.8.0-cudnn8-devel-ubuntu20.04-python${PY_VERSION}";
    IMAGE='zhenghuiz/cuda:11.8.0-cudnn8-devel-ubuntu20.04-python${PY_VERSION}';
    docker build --build-arg PYTHON_VERSION=latest -t $IMAGE .;
else
    echo "PY_VERSION must be set to 3.10 | 3.9 | 3.8";
    exit 1;
fi


if [ $? -eq 0 ]; then
    echo "build success.";
else
    echo "build failure.";
    exit 1;
fi

docker push $IMAGE;

if [ $? -eq 0 ]; then
    echo "push success.";
else
    echo "push failure.";
    exit 1;
fi