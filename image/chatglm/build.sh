#!/bin/bash

if [ $1 = "3.10" ]; then
    echo "build 11.8.0-cudnn8-devel-ubuntu20.04-python3.10-chatglm"
    image='zhenghuiz/cuda:11.8.0-cudnn8-devel-ubuntu20.04-python3.10-chatglm'
    docker build --build-arg BASE_IMAGE=zhenghuiz/cuda:11.8.0-cudnn8-devel-ubuntu20.04-python3.10 -t $image .
elif [ $1 = "3.9" ]; then
    echo "build 11.8.0-cudnn8-devel-ubuntu20.04-python3.9-chatglm-chatglm"
    image='zhenghuiz/cuda:11.8.0-cudnn8-devel-ubuntu20.04-python3.9-chatglm'
    docker build --build-arg BASE_IMAGE=zhenghuiz/cuda:11.8.0-cudnn8-devel-ubuntu20.04-python3.9 -t $image .
elif [ $1 = "3.8" ]; then
    echo "build 11.8.0-cudnn8-devel-ubuntu20.04-python3.8-chatglm"
    image='zhenghuiz/cuda:11.8.0-cudnn8-devel-ubuntu20.04-python3.8-chatglm'
    docker build --build-arg BASE_IMAGE=zhenghuiz/cuda:11.8.0-cudnn8-devel-ubuntu20.04-python3.8 -t $image .
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