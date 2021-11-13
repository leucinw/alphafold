#!/bin/bash

# This file is adapted from github.com/kuixu

# conda pkgs
#conda create -n alphafold2 python=3.8 -y
#conda activate alphafold2
#
##
## version number of cudnn has been modified.. 
## check here: https://developer.nvidia.com/rdp/cudnn-archive
##

conda install -y -c conda-forge cudnn=8.1.0
conda install -y -c bioconda hmmer hhsuite==3.3.0 kalign2

conda install -y -c conda-forge \
      openmm=7.5.1 \
      pdbfixer \
      pip

# python pkgs
pip3 install --upgrade pip \
    && pip3 install -r ./requirements.txt \
    && pip3 install --upgrade "jax[cuda111]" -f \
    https://storage.googleapis.com/jax-releases/jax_releases.html \
    && pip3 install jaxlib==0.1.70+cuda111 -f \
    https://storage.googleapis.com/jax-releases/jax_releases.html

work_path=`pwd`
# update openmm 
a=$(which python)
cd $(dirname $(dirname $a))/lib/python3.8/site-packages
patch -p0 < $work_path/docker/openmm.patch

