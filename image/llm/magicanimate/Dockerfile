# The base-deps Docker image installs main libraries needed to run Ray

# The GPU options are NVIDIA CUDA developer images

ARG BASE_IMAGE

# ARG PYTHON_VERSION=latest
FROM ${BASE_IMAGE}

# RUN pip install torch --no-cache-dir --index-url https://download.pytorch.org/whl/cu118

RUN $HOME/anaconda3/bin/pip install imageio \
    omegaconf==2.3.0 \
    imageio==2.9.0 \
    imageio-ffmpeg==0.4.3 \
    diffusers==0.21.4 \
    && $HOME/anaconda3/bin/conda clean -y --all \
    && sudo rm -rf /var/lib/apt/lists/* \
    && sudo apt-get clean

USER user