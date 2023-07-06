# The base-deps Docker image installs main libraries needed to run Ray

# The GPU options are NVIDIA CUDA developer images

ARG BASE_IMAGE
# ARG PYTHON_VERSION=latest
FROM ${BASE_IMAGE}

RUN pip install torch --no-cache-dir --index-url https://download.pytorch.org/whl/cu118

RUN pip install protobuf \
    transformers==4.30.2 \
    cpm_kernels \
    gradio \
    mdtex2html \
    sentencepiece \
    accelerate \
    sentence-transformers \
    sse-starlette --no-cache-dir -i https://pypi.org/simple
