ARG JUPYTER_IMAGE_VERSION
FROM jupyter/base-notebook:$JUPYTER_IMAGE_VERSION

USER root

# Install git
RUN apt-get update && \
    apt-get install -y git && \
    git config --system credential.helper 'store --file ~/.git-credentials' && \
    rm -rf /var/lib/apt/lists/*

RUN echo "jovyan ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/jovyan-sudo && \
    chmod 0440 /etc/sudoers.d/jovyan-sudo
USER jovyan

# Install extensions
COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt