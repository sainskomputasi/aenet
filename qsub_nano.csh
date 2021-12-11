#!/bin/sh -f
#PBS -N aenet
#PBS -q normal
#PBS -l nodes=1:ppn=20
#PBS -l walltime=23:59:59

export I_MPI_PIN=1
#export I_MPI_FABRICS=shm:dapl  # for many parallel (more than 2 nodes)
#export I_MPI_FABRICS=shm:ofa  # for 2 node parallel
export I_MPI_ADJUST_ALLGATHERV=2
export OMP_NUM_THREADS=1

cd $PBS_O_WORKDIR

#Deklarasi executable program
ln -fs /home/u0008/AENET/src/aenet-2.0.3_20201001/bin/generate.x generate.x
#ln -fs /home/u0008/AENET/src/aenet-2.0.3_20201001/bin/predict.x predict.x
#ln -fs /home/u0008/AENET/src/aenet-2.0.3_20201001/bin/train.x train.x

mpirun ./generate.x generate.in > generate.out
#mpirun ./predict.x predict.in > predict.out
#mpirun ./train.x train.in > train.out


