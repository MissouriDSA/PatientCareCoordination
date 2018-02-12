# Logging into the secure cluster

1. VPN Connection : 
 - LINUX: 
   > vpn connect anyconnect.missouri.edu
   
    > -- Comment : select "vsecure4" VPN
   
   > ssh socialteam.gogginss@secure4.missouri.edu

1.1 Data Location: 

ls -alrt /group/socialteam/shared/phi_data

## Useful Server Commands

Go do the data directory: 
> cd  /group/socialteam/shared/phi_data

List all the files: 
> ls  /group/socialteam/shared/phi_data

List all the files in order of how recent they are, and with additional info like size and date: 
> ls -lart  /group/socialteam/shared/phi_data

Show the top row of the file
> head -1  /group/socialteam/shared/phi_data/[file-name]

SHow the top 10 rows of the file: 
> head  /group/socialteam/shared/phi_data/[file-name]

copy a file so you can add columns, etc. 
> cp  /group/socialteam/shared/phi_data/[file-name]  /group/socialteam/shared/phi_data/[NEWFILE]

make a new directory
> mkdir  /group/socialteam/shared/phi_data/[new-directory-name]


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
    
*SLURM DOCS*: http://docs.rnet.missouri.edu/SLURM/slurm

