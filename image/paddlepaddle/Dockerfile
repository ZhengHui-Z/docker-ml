# The base-deps Docker image installs main libraries needed to run Ray

# The GPU options are NVIDIA CUDA developer images

ARG BASE_IMAGE
# ARG PYTHON_VERSION=latest
FROM ${BASE_IMAGE}

RUN pip install torch --no-cache-dir --index-url https://download.pytorch.org/whl/cu118 \
    && pip install paddlepaddle-gpu==2.5.0.post118 -f https://www.paddlepaddle.org.cn/whl/linux/mkl/avx/stable.html \
    && pip install paddleocr
