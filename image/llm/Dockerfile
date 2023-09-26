# The base-deps Docker image installs main libraries needed to run Ray

# The GPU options are NVIDIA CUDA developer images

ARG BASE_IMAGE
ARG FLASH_ATTEN
# ARG PYTHON_VERSION=latest
FROM ${BASE_IMAGE}

RUN pip install torch --no-cache-dir --index-url https://download.pytorch.org/whl/cu118

RUN $HOME/anaconda3/bin/pip install protobuf \
    transformers==4.30.2 \
    cpm_kernels \
    gradio \
    mdtex2html \
    sentencepiece \
    accelerate \
    sentence-transformers \
    sse-starlette --no-cache-dir \
    gradio \
    # support Qwen model
    tiktoken \
    einops \
    transformers_stream_generator==0.0.4 \
    auto-gptq \
    optimum \
    bitsandbytes -i http://mirrors.aliyun.com/pypi/simple/
ADD ./flash-attention /tmp/flash-attention
# USER root
# $HOME/anaconda3/bin/pip install /tmp/flash-attention \
#     && $HOME/anaconda3/bin/pip install /tmp/flash-attention/csrc/layer_norm \
#     && $HOME/anaconda3/bin/pip install /tmp/flash-attention/csrc/rotary \
RUN if [ ${FLASH_ATTEN} -eq 1 ]; then \
        echo "install flash-attention"; \
        $HOME/anaconda3/bin/pip install /tmp/flash-attention \
        && $HOME/anaconda3/bin/pip install /tmp/flash-attention/csrc/layer_norm \
        && $HOME/anaconda3/bin/pip install /tmp/flash-attention/csrc/rotary; \
    fi \
    && sudo rm -rf /tmp/flash-attention \
    && $HOME/anaconda3/bin/conda clean -y --all \
    && sudo rm -rf /var/lib/apt/lists/* \
    && sudo apt-get clean
USER user