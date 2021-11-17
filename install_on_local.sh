#!/bin/bash

# This file was adapted from github.com/kuixu

# create alphafold2_cu11 environment 
#conda create -n alphafold2_cu11 python=3.8 -y
#conda activate alphafold2_cu11

# create alphafold2_cu10 environment 
#conda create -n alphafold2_cu10 python=3.8 -y
#conda activate alphafold2_cu10

#wget https://git.scicore.unibas.ch/schwede/openstructure/-/raw/7102c63615b64735c4941278d92b554ec94415f8/modules/mol/alg/src/stereo_chemical_props.txt 
#mv stereo_chemical_props.txt ./alphafold/common

# cudnn version number: https://developer.nvidia.com/rdp/cudnn-archive

conda install -y -c conda-forge cudnn=8.1.0
conda install -y -c bioconda hmmer hhsuite==3.3.0 kalign2

conda install -y -c conda-forge \
      openmm=7.5.1 \
      pdbfixer \
      pip

# for cuda 11.2
#pip3 install --upgrade pip \
#    && pip3 install -r ./requirements.txt \
#    && pip3 install --upgrade "jax[cuda111]" -f \
#    https://storage.googleapis.com/jax-releases/jax_releases.html \
#    && pip3 install jaxlib==0.1.69+cuda111 -f \
#    https://storage.googleapis.com/jax-releases/jax_releases.html

# for cuda10.2
pip3 install --upgrade pip \
    && pip3 install -r ./requirements.txt \
	  && pip3 install --upgrade "jax[cuda102]" -f \
    https://storage.googleapis.com/jax-releases/jax_releases.html \
    && pip3 install jaxlib==0.1.69+cuda102 -f \
    https://storage.googleapis.com/jax-releases/jax_releases.html

work_path=`pwd`
# update openmm 
a=$(which python)
cd $(dirname $(dirname $a))/lib/python3.8/site-packages
patch -p0 < $work_path/docker/openmm.patch

# see alphafold2_cu10.yml for cuda10.2 settings 
# see alphafold2_cu11.yml for cuda11.2 settings 
