# The base-deps Docker image installs main libraries needed to run Ray

# The GPU options are NVIDIA CUDA developer images

ARG BASE_IMAGE
# ARG PYTHON_VERSION=latest
FROM ${BASE_IMAGE}

RUN pip install torch --no-cache-dir --index-url https://download.pytorch.org/whl/cu118

RUN $HOME/anaconda3/bin/pip --no-cache-dir install protobuf \
    transformers==4.34.0 \
    cpm_kernels \
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
    auto-gptq==0.4.2 \
    optimum \
    bitsandbytes \
    jupyterlab \
    ipywidgets

COPY ./flash-attention /tmp/flash-attention

USER root

RUN $HOME/anaconda3/bin/pip --no-cache-dir install /tmp/flash-attention \
    && $HOME/anaconda3/bin/pip --no-cache-dir install /tmp/flash-attention/csrc/layer_norm \
    && $HOME/anaconda3/bin/pip --no-cache-dir install /tmp/flash-attention/csrc/rotary \
    && sudo rm -rf /tmp/flash-attention \
    && $HOME/anaconda3/bin/conda clean -y --all \
    && sudo rm -rf /var/lib/apt/lists/* \
    && sudo apt-get clean \
    && sudo chown -R $USER_UID:users $HOME/anaconda3
USER user
