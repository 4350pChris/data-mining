FROM jupyter/datascience-notebook

COPY --chown=${NB_UID}:${NB_GID} requirements.txt /tmp/

RUN pip install -r /tmp/requirements.txt && \
    pip cache purge && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
