# Logging into the secure cluster



# Loading

1. module avail - lists modules available
2. module load "R/R-3.3.1"
 - This just loads your path [socialteam.gogginss@src-login ~]$ module load R/R-3.3.1
[socialteam.gogginss@src-login ~]$ echo $PATH
/home/cluster/rcss-spack/opt/spack/linux-centos7-x86_64/gcc-4.8.5/R-3.3.1-y7hviwqorqpyeetllgchzoin4fzhprvb/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/socialteam.gogginss/.local/bin:/home/socialteam.gogginss/bin
3. sinfo : provides cluster status (partition, nodes, state and name of nodes)
4. srun -N3 -n3 -t 0-00:04:00 hostname (this is the worlds fastest ssh)
 - if the nodes are available, please grab them
 - "-N" number of nodes
 - "-n" number of tasks across the notes
 - "-t" time : 0 days, 4 minutes in this example
 - hostname reports back the true hostname of the nodes running the tasks

5. Interacting with R : To do so interactively

      `srun -N 1 --pty R -t 0-00:10:00 --no-save`
 - number of nodes,
 - "--pty" : puts the result back to my terminal
 - "R"  is "R"
 - "--no-save" : is an R option
 - "-t" : Keep in mind that we are putting our feet on people in the cluster.

6. Running the job

    `sbatch rscript.sh`

    `Submitted batch job 158`

7. Next Steps
 - `sacct`

8. Master data is here:

    `/group/socialteam/shared/masterdata_file`
