#!/bin/bash

if [ $# -ne 1 ]; then
    echo "missing argument PY_VERSION, defaulting to python3.10.";
    PY_VERSION='310';
else
    PY_VERSION=$1;
fi


if [ $PY_VERSION = "310" ] || [ $PY_VERSION = "39" ] || [ $PY_VERSION = "38" ]; then
    echo "build 11.8.0-cudnn8-devel-ubuntu20.04-py${PY_VERSION}";
    IMAGE="zhenghuiz/cuda:11.8.0-cudnn8-devel-ubuntu20.04-py${PY_VERSION}";
    if [ $PY_VERSION = "310" ]; then
        PY_VERSION='py310_23.10.0-1'
    fi
    # --no-cache 
    docker build --build-arg PYTHON_VERSION=$PY_VERSION -t $IMAGE .;
else
    echo "PY_VERSION must be set to 310 | 39 | 38";
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