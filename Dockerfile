FROM jupyter/datascience-notebook

COPY --chown=${NB_UID}:${NB_GID} requirements.txt /tmp/

RUN mamba install --yes --file /tmp/requirements.txt && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
