
# Cluster practicals

::: {.callout-warning }

## Important

If you got here before the first lecture, please do not try to complete this exercise yourself. We will do it together in class when we meet.

:::

The exercises in this course will be done using our cluster computer. It is called GenomeDK and you can [read about it here](https://genome.au.dk/). We have already recieved a username and a password for the cluster. More about that later. 

It important that you know that your account on the cluster is **temporary**. It will be deleted once the course is finished, along with any files you have on the cluster. So make sure to download any files you want to keep before the course is over. Also, your files are **not backed up**. So if you delete a file, it is gone.

The cluster is a very large collection of computers with a shared file system. Using a terminal, you can connect to the cluster from your own computer to run programs. Using other programs you can also create and edit files the same way you can on your own machine. The goal of this exercise is to make you familiar with the cluster and to get you set up to do the exercises in this course. 

## Setting up your own machine

Before we get to the cluster we need to get you properly set up on your own machine. Install VS Code if you did not do so already. VS Code has both an editor and a terminal, and looks the same on Windows and Mac.

To get a terminal in vscode, press Ctrl+Shift+P (windows) / Cmd+Shift+P (Mac) to open the Command Palette. Then type "Create new terminal". You will see it auto-completes quite nicely. Select "Terminal: Create new terminal" and press Enter.

### The Terminal

Most of the programs we will use in this course are command line applications. I.e. programs that are executed by writing their name and any arguments in a terminal rather than clicking on an icon and using a graphical user interface. There are many different programs that can serve as a terminal. We will use the one that comes with VS code.
You will need to know the basics on using a terminal and with executing commands on the command line. If you have not used a terminal before, or if you are a bit rusty, you should run through [this primer](https://lifehacker.com/5633909/who-needs-a-mouse-learn-to-use-the-command-line-for-almost-anything) before you go on. -->


### Your home on the cluster

When you log into the cluster, you are put in your "home folder". All users have a home folder. However, in this course you will not be using your home folder. We have made a special folder with the same name as your usename in the `populationgenomics/students` folder. You should keep everything related to the course in this folder. To get from your home folder to the this course folder you just `cd`:

```bash
cd populationgenomics/students/username
```

(replace `username` with your cluster user name)

### Connecting to the cluster

You connect to the cluster from the terminal by executing this command (replace `username` with your cluster user name):

```bash
ssh username@login.genome.au.dk
```

When you do, you are prompted for the password for your cluster username. Enter that and press enter. You are now in your home folder on the cluster. Your terminal looks the same as before but it will print:

```
  _____                                ______ _   __
 |  __ \                               |  _  \ | / /
 | |  \/ ___ _ __   ___  _ __ ___   ___| | | | |/ /
 | | __ / _ \ '_ \ / _ \| '_ ` _ \ / _ \ | | |    \
 | |_\ \  __/ | | | (_) | | | | | |  __/ |/ /| |\  \
  \____/\___|_| |_|\___/|_| |_| |_|\___|___/ \_| \_/
```

If you run the `hostname` command, you can see that you are on `fe-open-01`. Now log out of the cluster again. You do that using `exit` command or by pressing `Ctrl-d`. Now you are back on your own machine. Try `hostname` again and see what your own machine is called.


### Allow login without password

You will need to log in to the cluster many many times, so you should set up your `ssh` connection to the cluster so you can connect securely without typing the password every time. You do not need to know *how* this works, but if you are interested, here is roughly how:

> First, you need to know what public and private encryption keys are. A private key is a very long, random sequence of bits. A private key is kept secret and never leaves your own machine. A public key is another string of bits that is a derivative of the private key. You can generate a unique public key from the private key, but cannot get the private key from a public key: Is a one-way process. Using the public key, you can encrypt (or sign) any message, and it will only be possible to decrypt it using the private key. In other words, anyone with your public key can send you an encrypted messages that only you will be able to read. So, if the cluster has your public key saved, it can authenticate you like this: The cluster sends your machine a message that is encrypted using your public key. Your machine then decrypts the message using its private key and sends it back. If the cluster agrees it is decrypted correctly, it logs you in.

First check if you have these two authentication files on your local machine (you can do so by running `ls -a ~/.ssh` in the terminal):

```bash
~/.ssh/id_rsa
~/.ssh/id_rsa.pub
```

You most likely do not. If so, you generate a pair of authentication keys with the command below. Just press Enter when asked "Enter file in which to save the key". Do not enter a passphrase when prompted - just press enter:

```bash
ssh-keygen -t rsa
```

Now use `ssh` to create a directory `~/.ssh` on the cluster (assuming your username on the cluster is `username`). You will be prompted for your password.

```bash
ssh username@login.genome.au.dk mkdir -p .ssh
```

Finally, append the public `ssh` key on your local machine to the file `.ssh/authorized_keys` on the cluster and enter your password (replace `username` with your cluster user name):

```bash
cat ~/.ssh/id_rsa.pub | ssh username@login.genome.au.dk 'cat >> .ssh/authorized_keys'
```

From now on you can log into the cluster from your local machine without being prompted for a password.

## Setting up your home on the cluster

Now log in to the cluster

```bash
ssh username@login.genome.au.dk
```

(see, not password).

# VS code on the cluster

Now that you have this set up, you can use vscode to log in. To set this up, click the icon depicting four squares in the leftmost icon bar. In the panel that expands, use the top search field to search for "Remote Development" and install the extension pack. Once you have done that, you can click the bottom left corner with the two facing arrows and select "Connect to host..." or "Connect current window to host...", enter username@login.genome.au.dk and press enter. Once vscode has installed some extensions, you are logged in. Now you can open vscode in whatever folder you want. Open `populationgenomics/students/username`, which is your folder for the course exercises.

### Install Pixi on your cluster account

You need to the Pixi package manager to install the tools you need for each exercise. Log in to the cluster and install pixi by running this command in the vscode terminal:

```bash
curl -fsSL https://pixi.sh/install.sh | sh
```

## Testing your setup

Check that your current directory is your personal folder under populationgenomics/

```bash
pwd
```

Make a folder for your small test project:

```bash
mkdir tester
```

```bash
cd tester
```

```bash
pixi init
pixi add jupyter nodejs ipykernel seaborn 
```

```bash
pixi workspace channel add munch-group
pixi add iplot
```

<!-- ### Create an environment

You also need a dedicated conda environment on the cluster. We will name this `popgen` too, but in this one we will also install all the scientific software you will use in the exercises. Run this command to create the conda envionment: -->

<!-- TODO: make an environment that includes bcftools that is not broken. 
Students need bcftools in the psmc exercise. For now, bcftools is installed in the software folder.
So make this work: conda create -n popgen -c bioconda -c kaspermunch bwa platypus-variant samtools beagle plink admixture gnuplot vcftools bcftools
Maybe also change exercises to only using bcftools and not samtools -->
<!-- 
```bash
conda create -n popgen -c bioconda -c conda-forge -c kaspermunch bwa platypus-variant samtools beagle=4.1  plink admixture gnuplot vcftools --override-channels
```  
-->

### Running interactive commands on the cluster

When you connect to the cluster using vscode and open a terminal you are on the "front-end" of the cluster. Think of it as the lobby of a giant hotel. If you execute the `hostname` command you will get `fe-open-01`. `fe` is the name of the front-end machine. The "front-end" is a single machine shared by anyone who log in. So you cannot run resource intensive jobs there but quick commands are ok. Commands that finish in less than ten seconds are ok. In the exercises for this course, you will run software that takes much longer time to finish. So you need one of the computing machines on the cluster, so you can work on that instead. You ask for a computing machine by running this command:

```bash
srun --mem-per-cpu=1g --time=3:00:00 --account=populationgenomics --pty bash
```

That says that you need at most one gigabyte of memory, that you need it for at most three hours (the duration of the exercise), and that the computing expenses should be billed to the project `populationgenomics` (which is our course). When you execute the command, your terminal will say "srun: job 40924828 queued and waiting for resources". That means that you are waiting for a machine. Once it prints "srun: job 40924828 has been allocated resources", you have been logged into a computing node. If you execute the `hostname` command, you will get something like `s05n20.genomedk.net`. `s05n20` is a computing mechine. Now you can execute any command you like without causing trouble for anyone. 

Now try to log out of the compute node by executing the `exit` command or by pressing `Ctrl-d`. If you execute the `hostname` command again you will get `fe1.genomedk.net` showing that you are back at the front-end mechine.


### Running commands in the terminal

When you log into the cluster you land on the "front-end" of the cluster. The "front-end" is a single machine shared by anyone who log in. You cannot run resource intensive jobs there, but quick commands are ok. Commands that finish in less than ten secons are ok. Try this command that prints "echos" the string "I can run interactive commands!" to the file `nice.txt`:

```bash
echo "I can run interactive commands!" > nice.txt
```

Use the `cat` command to show the contents of `nice.txt` in the terminal:

```bash
cat nice.txt
```

### Running interactive commands on the cluster

Say the command above was a long-running command like some population genomic analysis. Then you cannot run it on the front-end. You need to ask for one of the computing machines on the cluster so you can work on that instead. You do that by running this command:

```bash
srun --mem-per-cpu=1g --time=3:00:00 --account=populationgenomics --pty bash
```

Thay way you will use at most one gigabyte of memory, that you need at most three hours (the duration of the exercise), and that the computing expensenses should be billed to the project populationgenomics (which is our course). When you execute the command your terminal will say "srun: job 40924828 queued and waiting for resources". That means that you have asked for a machine. Once it prints "srun: job 40924828 has been allocated resources", you have been logged into a computing node. If you execute the `hostname` command you will get something like `s05n20.genomedk.net`. `s05n20` is a computing mechine. Now you can execute any command you like without causing trouble for anyone. Now try to log out of the compute node by executing the `exit` command or by pressing `Ctrl-d`. If you execute the `hostname` command again you will get `fe1.genomedk.net`. `fe1` is the front-end. -->

<!-- 
### Queueing commands on the cluster

Say the command above was a long-running command like some population genomic analysis. Then you cannot run it on the front-end. You need to submit it as a job to the cluster. When you do that, the job gets queued along with many other jobs, and as soon as the requested resources are available on the cluster, the job will start on one the many many machines. To submit a job, you must first create a file (a "batch script") that contains both the requested computer resources and the command you want to run. 

Create a file called `myscript.sh` with exactly this content:

```bash
#!/bin/bash
#SBATCH --mem=1gb
#SBATCH --time=01:00:00
#SBATCH --account=populationgenomics
#SBATCH --job-name=firstjob

echo "I can submit cluster jobs now!" > evennicer.txt
```

The first line says this is a bash script, the lines following three lines says that your job needs at most one gigabyte of memory, will run for at most one hour, that the expensenses should be billed to the project populationgenomics (which is our course). The fourth line gives the name of the name of the job. Here we have called it `firstjob`, but you should name it something sensible. 

You submit the job using the `sbatch` command: 

```bash
sbatch myscript.sh
```

Now your job is queued. Use the `mj` command to see what jobs you have queed or running. That will show something like this:

```txt
                                                                        Alloc
Job ID           Username Queue    Jobname    SessID NDS  S Elap Time   nodes
---------------- -------- -------- ---------- ------ ---  - ----------  -----
34745986         kmt      normal   firstjob       --   1  R 0-00:19:27  s03n56
```

If you want to cancel your this job before it finishes, you can use the `scancel` command:

```bash
scancel 34745986
```

Once your job finishes, it has created the file `evennicer.txt` and written "I can submit cluster jobs now!" to it. So see that you can use the `cat` command:

```bash
cat evennicer.txt
```

When you a program or script on the commandline it usually also prints some information in the terminal. When you run a job on the cluster there is no terminal to print to. Instead this is written to two files that you can read when the job finishes. In this case the fiels are called `firstjob.stdout` and `firstjob.stderr`. So see what is in them, you can use the `cat` command:

```bash
cat firstjob.stdout
```

and

```bash
cat firstjob.stderr
```

That is basically it.  -->

### How to copy files to and from the cluster

Once logged into the cluster wih vscode, you an right-click files in the file browser and select "Download". To upload files to the cluster folder, you can just drag them into the file browser.

<!-- 
You may need to transfer files back and forth between your own machine and the cluster. To copy a file called `file` in a directory called `dir` on the cluster to the current folder on your own machine, you can use the `scp` command:
```bash
scp username@login.genome.au.dk:dir/file .
```

To copy a file called `file` in the current folder on your own machine to a folder called `dir` on the cluster, you do this:

```bash
scp ./file username@login.genome.au.dk:dir/
``` 
-->

<!-- 
### How to run a Jupyter notebook on the cluster

Jupyter runs best in the [Chrome browser](https://www.google.com/chrome). For the best experience, install that before you go on. It does not need to be your default browser. `slurm-jupyter` will use it anyway. Now make sure you are on your own machine and that your `popgen` environment is activated. Then run this command to start a jupyter notebook on the cluster and send the display to your browser:

```bash
slurm-jupyter -u usernanme -A populationgenomics -e jupyter -m 1g -t 3h --run notebook
```

(replace `username` with your cluster user name)

Watch the terminal to see what is going on. After a while a jupyter notebook should show up in your browser window. The first time you do this, your browser may refuse to show jupyter because the connection is unsafe. In Safari you proceed to allow this. In Chrome, you can simply type the characters "thisisunsafe" while in the Chrome window:

<img src="img/thisisunsafe.png" alt="image" width="450"/>

Once ready, jupyter may ask for your cluster password. To close the jupyter notebook, press `Ctrl-c` in the terminal. Closing the browser window does **not** close down the jupyter on the cluster. You can [read this tutorial](https://www.dataquest.io/blog/jupyter-notebook-tutorial/) to learn how to use a jupyter notebook.

 -->

