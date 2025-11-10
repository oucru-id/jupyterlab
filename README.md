# JupyterLab Environment

This repository provides a customized JupyterLab environment built with Docker. It includes several popular extensions to enhance the JupyterLab experience.

## Included Extensions

- `jupyterlab-git`: Git integration for JupyterLab.
- `jupyterlab-code-formatter`: Code formatting support.
- `jupyterlab-search-replace`: Advanced search and replace functionality.
- `jupyterlab-day` and `jupyterlab-night`: Light and dark themes.
- `jupyterlab-lsp`: Language Server Protocol support for features like code completion and navigation.
- `jedi-language-server`: A language server for Python.

## Usage

1.  **Build and run the container:**

    ```bash
    docker-compose up -d --build
    ```

2.  **Access JupyterLab:**

    Open your browser and navigate to `http://localhost:8888`.