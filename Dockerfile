FROM andrewosh/binder-base

#ARG NB_USER=jovyan
#ARG NB_UID=1000
#ENV USER ${NB_USER}
#ENV NB_UID ${NB_UID}
#ENV HOME /home/${NB_USER}
#
#RUN adduser --disabled-password \
#    --gecos "Default user" \
#    --uid ${NB_UID} \
#    ${NB_USER}

RUN conda create -y -c conda-forge -n sunpy python=3.7 sunpy jupyter ipywidgets nbformat=4.2.0

RUN /bin/bash -c "source activate sunpy && ipython kernel install --user"
RUN /home/main/anaconda2/envs/sunpy/bin/python -c "import sunpy.data; sunpy.data.download_sample_data()"
#RUN /home/main/anaconda2/envs/sunpy/bin/python ./03-SunPy2/download_coord_data.py
