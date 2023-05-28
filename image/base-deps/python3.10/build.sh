#!/bin/bash

image='zhenghuiz/cuda:11.8.0-cudnn8-devel-ubuntu20.04-python3.10'

docker build -t $image .

if [ $?=1 ]; then
    echo "build success."
else
    echo "build failure."
fi

docker push $image

echo "push success."

if [ $?=1 ]; then
    echo "push success."
else
    echo "push failure."
fi