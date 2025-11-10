ARG JUPYTER_IMAGE_VERSION
FROM jupyter/base-notebook:$JUPYTER_IMAGE_VERSION

USER root

# Install git
RUN apt-get update && \
    apt-get install -y git sudo && \
    git config --system credential.helper 'store --file ~/.git-credentials' && \
    rm -rf /var/lib/apt/lists/*

# Create user and grant sudo
ARG JUPYTER_USER=jupyter_user
RUN useradd -m -s /bin/bash -N -g users ${JUPYTER_USER} && \
    chmod 0440 /etc/sudoers.d/jovyan && \
    echo "${JUPYTER_USER} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${JUPYTER_USER}

# Install extensions
COPY --chown=${JUPYTER_USER}:users requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Switch to user
USER ${JUPYTER_USER}
WORKDIR /home/${JUPYTER_USER}