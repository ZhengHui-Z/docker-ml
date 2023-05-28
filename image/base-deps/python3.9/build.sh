#!/bin/bash

image='zhenghuiz/cuda:11.8.0-cudnn8-devel-ubuntu20.04-python3.9'

docker build -t $image .

if [ $?=0 ]; then
    echo "build success."
else
    echo "build failure."
fi

docker push $image


if [ $?=0 ]; then
    echo "push success."
else
    echo "push failure."
fi