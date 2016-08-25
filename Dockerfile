FROM andrewosh/binder-base

USER main

RUN conda create -y -c conda-forge -n sunpy python=3.5 sunpy jupyter
RUN /bin/bash -c "source activate sunpy && ipython kernel install --user"
RUN /home/main/anaconda2/envs/sunpy/bin/python -c "import sunpy.data; sunpy.data.download_sample_data()"
RUN /home/main/anaconda2/envs/sunpy/bin/python ./03-SunPy2/download_coord_data.py
