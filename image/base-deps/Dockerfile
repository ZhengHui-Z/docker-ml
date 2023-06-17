# The base-deps Docker image installs main libraries needed to run Ray

# The GPU options are NVIDIA CUDA developer images

ARG BASE_IMAGE="nvidia/cuda:11.8.0-cudnn8-devel-ubuntu20.04"
# ARG PYTHON_VERSION=latest
# ARG PYTHON_VERSION=py39_23.3.1-0
# ARG PYTHON_VERSION=py38_23.1.0-1
FROM ${BASE_IMAGE}

# FROM directive resets ARG


ADD sources.list /etc/apt/sources.list
ARG PYTHON_VERSION
# If this arg is not "autoscaler" then no autoscaler requirements will be included

ENV TZ=Asia/Shanghai

# TODO(ilr) $HOME seems to point to result in "" instead of "/home/user"

ENV PATH "/home/user/anaconda3/bin:$PATH"
ARG DEBIAN_FRONTEND=noninteractive
# ARG PYTHON_VERSION=3.10.10

ARG HOSTTYPE=${HOSTTYPE:-x86_64}

ARG USER_UID=1000
ARG USER_GID=100

RUN apt-get update -y \
    && apt-get install -y sudo tzdata \
    && useradd -ms /bin/bash -d /home/user user --uid $USER_UID --gid $USER_GID \
    && usermod -aG sudo user \
    && echo 'user ALL=NOPASSWD: ALL' >> /etc/sudoers \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

USER $USER_UID
ENV HOME=/home/user

# Todo (krfricke): Move to latest miniconda version once we stop building

# images for Python 3.10.10

# <https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-${HOSTTYPE}.sh>
ADD pip.conf /home/user/.pip/pip.conf

RUN sudo apt-get update -y && sudo apt-get upgrade -y \
    && sudo apt-get install -y \
    vim \
    git \
    wget \
    curl \
    screen \
    locales \
    && sudo locale-gen en_US.UTF-8 \
    && wget \
    --quiet "https://repo.anaconda.com/miniconda/Miniconda3-${PYTHON_VERSION}-Linux-${HOSTTYPE}.sh" \
    -O /tmp/miniconda.sh \
    # -b           run install in batch mode (without manual intervention),
    # it is expected the license terms (if any) are agreed upon
    # -f           no error if install prefix already exists
    # -h           print this help message and exit
    # -p PREFIX    install prefix, defaults to /home/user/miniconda3, must not contain spaces.
    # -s           skip running pre/post-link/install scripts
    # -u           update an existing installation
    # -t           run package tests after installation (may install conda-build)
    && /bin/bash /tmp/miniconda.sh -b -u -p $HOME/anaconda3 \
    && $HOME/anaconda3/bin/conda init \
    && echo 'export PATH=$HOME/anaconda3/bin:$PATH' >> /home/user/.bashrc \
    && rm /tmp/miniconda.sh \
    && $HOME/anaconda3/bin/conda clean -y --all \
    # To avoid the following error on Jenkins:
    # AttributeError: 'numpy.ufunc' object has no attribute '__module__'
    && $HOME/anaconda3/bin/pip uninstall -y dask \
    && sudo rm -rf /var/lib/apt/lists/* \
    && sudo apt-get clean

ENV LANG=en_US.UTF-8

WORKDIR $HOME
