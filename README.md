Embarassangly Parallel Teams
============================
Many embarassingly parallel simulationns currently involve 
launching an ensemble of simulations, each running the same 
executable program on different unique initial data.  In 
a scenario in which the initialization process involves
some common calculation that is expensive, e.g., taking
on the order of 30% of the run time, a worthwhile speedup
might be obtained from using all of the available resources
to compute the initial data rather than having each simulation
using a fraction of the computational resources to repeat the
common portion of hte initialization process.  For example,
in an ensemble of 10 simulations with each running on 100 cores,
a maximum speedup of 10 for the initialization might be achievable 
by spreading any common initial initialization functions across
all 1000 available cores before partitioning the computation into
10 independent simulations.   This could require expensive 
input/output if the jobs are truly independent processes launched
by some a script. 

This repository will test the approach of replacing the launch
scripts with a Fortran main program that performs the initialization
and then launches each individual simulation simultaneously using 
the Fortran 2015 team feature.
