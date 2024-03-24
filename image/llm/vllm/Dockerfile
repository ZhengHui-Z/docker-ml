# The base-deps Docker image installs main libraries needed to run Ray

# The GPU options are NVIDIA CUDA developer images

ARG BASE_IMAGE

FROM ${BASE_IMAGE}



COPY vllm-0.3.3+cu118-cp310-cp310-manylinux1_x86_64.whl /tmp/vllm-0.3.3+cu118-cp310-cp310-manylinux1_x86_64.whl

RUN $HOME/anaconda3/bin/pip install --upgrade pip

RUN $HOME/anaconda3/bin/pip install --no-cache-dir /tmp/vllm-0.3.3+cu118-cp310-cp310-manylinux1_x86_64.whl \
    && sudo rm /tmp/vllm-0.3.3+cu118-cp310-cp310-manylinux1_x86_64.whl

RUN $HOME/anaconda3/bin/pip install -U --no-cache-dir pydantic

RUN git clone https://github.com/lm-sys/FastChat.git \
    && $HOME/anaconda3/bin/pip install -e "FastChat[model_worker,webui]" \
    && sudo rm -rf FastChat


RUN $HOME/anaconda3/bin/pip uninstall torch -y \
    && $HOME/anaconda3/bin/pip install --no-cache-dir -U xformers==0.0.23 --index-url https://download.pytorch.org/whl/cu118

RUN $HOME/anaconda3/bin/conda clean -y --all \
    && sudo rm -rf /var/lib/apt/lists/* \
    && sudo apt-get clean

USER user