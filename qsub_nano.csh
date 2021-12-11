#!/bin/sh -f
#PBS -N aenet-generate
#PBS -q normal
#PBS -l nodes=1:ppn=20
#PBS -l walltime=23:59:59

export I_MPI_PIN=1
#export I_MPI_FABRICS=shm:dapl  # for many parallel (more than 2 nodes)
#export I_MPI_FABRICS=shm:ofa  # for 2 node parallel
export I_MPI_ADJUST_ALLGATHERV=2
export OMP_NUM_THREADS=1

cd $PBS_O_WORKDIR

#Declaration of the executable program
ln -fs /<adress the location of generate.x>/generate.x generate.x

mpirun ./generate.x generate.in > generate.out


