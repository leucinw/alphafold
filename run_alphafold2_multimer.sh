#!/usr/bin/bash

export SEQUENCE=$1
export CURRDIR=`pwd`
export DATABASE_DIR=/work/liuchw/alphafold_database

nohup python3 /home/liuchw/Documents/Github.leucinw/alphafold/run_alphafold.py \
	--data_dir=$DATABASE_DIR \
	--fasta_paths=$CURRDIR/$SEQUENCE \
	--output_dir=$CURRDIR/results \
	--uniref90_database_path=$DATABASE_DIR/uniref90/uniref90.fasta \
	--mgnify_database_path=$DATABASE_DIR/mgnify/mgy_clusters_2018_12.fa \
	--bfd_database_path=$DATABASE_DIR/bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt \
	--template_mmcif_dir=$DATABASE_DIR/pdb_mmcif/mmcif_files \
	--obsolete_pdbs_path=$DATABASE_DIR/pdb_mmcif/obsolete.dat \
	--max_template_date=2021-11-01 \
	--pdb_seqres_database_path=$DATABASE_DIR/pdb_seqres/pdb_seqres.txt \
	--uniclust30_database_path=$DATABASE_DIR/uniclust30/uniclust30_2018_08/uniclust30_2018_08 \
	--uniprot_database_path=$DATABASE_DIR/uniprot/uniprot.fasta \
	--is_prokaryote_list=false \
	--model_preset=multimer >af2.log 2>err &
