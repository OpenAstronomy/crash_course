FROM python:3.7-alpine

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir notebook==5.*
RUN pip3 install sunpy

RUN python -c "import sunpy.data; sunpy.data.download_sample_data()"
RUN python ./03-SunPy2/download_coord_data.py
