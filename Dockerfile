ARG JUPYTER_IMAGE_VERSION
FROM jupyter/base-notebook:$JUPYTER_IMAGE_VERSION

USER root

# Install git
RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

# Grant password-less sudo rights to the jovyan user
RUN echo "jovyan ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/jovyan && \
    chmod 0440 /etc/sudoers.d/jovyan

# Switch back to jovyan user and install extensions
USER jovyan
COPY --chown=jovyan:users requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt