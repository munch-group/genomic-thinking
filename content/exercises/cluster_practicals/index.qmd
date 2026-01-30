
# Cluster practicals



The exercises in this course will be done using the [GenomeDK](https://genome.au.dk/). If you do not already have one, please use [this form](https://console.genome.au.dk/user-requests/create/?zone=open) to request a user account on the GenomeDK cluster. I the "Reason" field, you can just write "Taking the course in Genomic Thinking".

Note that your account on the cluster is **temporary**. It will be deleted once the course is finished, along with any files you have on the cluster. So make sure to download any files you want to keep before the course is over. Also, your files are **not backed up**. So if you delete a file, it is gone.


## VS Code

Before we get to the cluster we need to get you properly set up on your own machine. Install VS Code if you did not do so already. VS Code has both an editor and a terminal, and looks the same on Windows and Mac. If you have not used a terminal before, or if you are a bit rusty, you should run through [this primer](https://lifehacker.com/5633909/who-needs-a-mouse-learn-to-use-the-command-line-for-almost-anything) before you go on To get a terminal in vscode, press Ctrl+Shift+P (windows) / Cmd+Shift+P (Mac) to open the Command Palette. Then type "Create new terminal". You will see it auto-completes quite nicely. Select "Terminal: Create new terminal" and press Enter.


## Connecting to the cluster

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

If you run the `hostname` command, you can see that you are on `fe-open-01`. Now log out of the cluster again. You do that using `exit` command or by pressing `Ctrl-d`. Now you are back on your own machine. Try `hostname` again and see what your own machine is called. All users have a home folder. However, in this course you will not be using your home folder. We have made a special folder with the same name as your usename in the `populationgenomics/students` folder. You should keep everything related to the course in this folder. To get from your home folder to the this course folder you just `cd`:

```bash
cd populationgenomics/students/username
```

(replace `username` with your cluster user name)

## Set up login without password

You will need to log in to the cluster many many times, so you should set up your `ssh` connection to the cluster so you can connect securely without typing the password every time. On your own computer, open the terminal of your choice and run the command below. This will generate a private/public key-pair with no password. If you have a key already, you can just use that (the command will warn you if you do).

```bash
ssh-keygen -t ed25519 -q -N ""
```

Run the command below to copy the public key to GenomeDK. You will be asked to enter your password for the cluster.

```bash
ssh-copy-id -i ~/.ssh/id_ed25519 <username>@login.genome.au.dk
```

You should now be able to log in to the cluster without typing your password. Running the command below, you should not be prompted for a password.

```bash
ssh <username>@login.genome.au.dk
```

## VS code on the cluster

Now that you have this set up, you can use vscode to log in. To set this up, click the icon depicting four squares in the leftmost icon bar. In the panel that expands, use the top search field to search for "Remote Development" and install the extension pack. Once you have done that, you can click the bottom left corner with the two facing arrows and select "Connect to host..." or "Connect current window to host...", enter username@login.genome.au.dk and press enter. Once vscode has installed some extensions, you are logged in. Now you can open vscode in whatever folder you want. Open `populationgenomics/students/username`, which is your folder for the course exercises. Once logged into the cluster wih vscode, you an right-click files in the file browser and select "Download". To upload files to the cluster folder, you can just drag them into the file browser.


## Install Pixi on your cluster account

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

## Running commands in the terminal

When you log into the cluster you land on the "front-end" of the cluster. The "front-end" is a single machine shared by anyone who log in. You cannot run resource intensive jobs there, but commands that finish in less than ten seconds are ok. For commands that take a long time to run, you need to ask for one of the computing machines on the cluster to run it on instead. Run the command below to request and log in to a computing machine. In this case you ask

```bash
srun --mem-per-cpu=8g --time=3:00:00 --account=populationgenomics --pty bash
```

Thay way you will use at most eight gigabyte of memory, that you need at most three hours (the duration of the exercise), and that the computing expenses should be billed to the project `populationgenomics` (which is our course). When you execute the command your terminal will say "srun: job 40924828 queued and waiting for resources". That means that you have asked for a machine. Once it prints "srun: job 40924828 has been allocated resources", you have been logged into a computing node. If you execute the `hostname` command you will get something like `s05n20.genomedk.net`. `s05n20` is a computing mechine. Now you can execute any command you like without causing trouble for anyone. Now try to log out of the compute node by executing the `exit` command or by pressing `Ctrl-d`. If you execute the `hostname` command again you will get `fe1.genomedk.net`. `fe1` is the front-end. -->

