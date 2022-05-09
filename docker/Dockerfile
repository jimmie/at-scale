FROM artifactory.jpl.nasa.gov:16001/gov/nasa/jpl/nisar/sds/pcm/nisar_ade_all:r1.7.4

ENV HOME=/home/jovyan \
    CONDA_DIR=/home/jovyan/.local/envs/isce

USER root
RUN $CONDA_DIR/bin/conda install -y nb_conda_kernels
RUN $CONDA_DIR/bin/pip install 'ipykernel<5.0.0'
RUN chmod 4777 $HOME

USER jovyan

# ONLY TOUCH IF YOU NEED MORE RECENT VERSION, OTHERWISE DON'T TOUCH!!
# RUN cd $HOME \
#     && git clone https://github.com/hysds/notebook_pge_wrapper.git \
#     && cd notebook_pge_wrapper \
#     && $CONDA_DIR/bin/pip install -e .

COPY . $HOME/at-scale

# installing user defined dependencies
RUN $CONDA_DIR/bin/papermill $HOME/at-scale/docker/requirements.ipynb /tmp/requirements_output.ipynb --log-output

WORKDIR $HOME

CMD ["/bin/bash", "--login"]
