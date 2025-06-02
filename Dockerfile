# Use scipy notebook as base
FROM jupyter/scipy-notebook

# As root
USER root

# Install compiler
RUN apt-get update -y && apt-get install -y build-essential

# As user
USER ${NB_UID}

# Setup environment
RUN pip install cmdstanpy arviz

# Install cmdstan
RUN install_cmdstan

# Clear entrypoint
ENTRYPOINT []

# Copy over notebooks
COPY *.ipynb work/
COPY figures work/figures
COPY stan work/stan
COPY data work/data

# Set permissions
USER root
RUN chmod -R 777 work/
RUN chown -R ${NB_UID}:${NB_GID} work/
#USER ${NB_UID}

# run from the home directory
WORKDIR "${HOME}"