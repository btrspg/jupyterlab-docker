FROM continuumio/miniconda3
MAINTAINER Chen Yuelong <yuelong.chen.btr@gmail.com>

RUN conda install -y  -c conda-forge  jupyterlab julia r-irkernel && \
    jupyter notebook --generate-config

WORKDIR /tmp
COPY installIJulia.jl jupyter_notebook_config.py ./
RUN julia installIJulia.jl && \
    cp jupyter_notebook_config.py /root/.jupyter/

RUN rm /tmp/*

WORKDIR /lab

CMD jupyter lab --ip 0.0.0.0 --allow-root




