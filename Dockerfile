ARG JUPYTER_IMAGE_VERSION
FROM quay.io/jupyter/base-notebook:$JUPYTER_IMAGE_VERSION

USER root

# Install git
RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

USER ${NB_USER}

# Git Config
RUN git config --global credential.helper 'store --file ~/.git-credentials'

# Install extensions
COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt