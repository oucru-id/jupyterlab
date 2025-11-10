ARG JUPYTER_IMAGE_VERSION
FROM jupyter/base-notebook:$JUPYTER_IMAGE_VERSION

USER root

# Install git
RUN apt-get update && \
    apt-get install -y git && \
    git config --system credential.helper 'store --file ~/.git-credentials' && \
    rm -rf /var/lib/apt/lists/*

# Switch back to jovyan user and install extensions
USER jovyan
COPY --chown=jovyan:users requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt