# The base-deps Docker image installs main libraries needed to run Ray

# The GPU options are NVIDIA CUDA developer images

ARG BASE_IMAGE

FROM ${BASE_IMAGE}


RUN $HOME/anaconda3/bin/pip install --upgrade pip

RUN wget -O /tmp/vllm-0.4.0.post1+cu118-cp310-cp310-manylinux1_x86_64.whl https://github.com/vllm-project/vllm/releases/download/v0.4.0.post1/vllm-0.4.0.post1+cu118-cp310-cp310-manylinux1_x86_64.whl \
    && $HOME/anaconda3/bin/pip install --no-cache-dir /tmp/vllm-0.4.0.post1+cu118-cp310-cp310-manylinux1_x86_64.whl \
    && sudo rm /tmp/vllm-0.4.0.post1+cu118-cp310-cp310-manylinux1_x86_64.whl

RUN $HOME/anaconda3/bin/pip install --no-cache-dir pydantic>=2.6.4

# xformers==0.0.23
RUN $HOME/anaconda3/bin/pip uninstall torch -y \
    && $HOME/anaconda3/bin/pip install --no-cache-dir -U xformers --index-url https://download.pytorch.org/whl/cu118

RUN $HOME/anaconda3/bin/conda clean -y --all \
    && sudo rm -rf /var/lib/apt/lists/* \
    && sudo apt-get clean

USER user