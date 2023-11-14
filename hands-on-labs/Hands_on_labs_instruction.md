### Hands-on labs Summary

<details>
<summary>#### Week 1</summary>

0. AWS Academy Foundations course (includes some labs)
1. Setup your programming IDE with Visual Studio Code and learn it
2. Learn vs code and live share (remote pair programming)
3. Learn Git and GitHub

</details>

<details>
<summary>#### Week 2</summary>

0. AWS Academy Foundations course (includes some labs)
1. Clone and/or update our local course repository
2. Learn how to use SSH with GitHub.com
3. Learn how to create an AWS Ubuntu 22.04 server instance, with firewall and Elastic IP Address
4. Learn how to use SSH with your new AWS Ubuntu server instance
5. Learn how to use a local vs code with a remote cloud based Ubuntu server instance

</details>

<details>
<summary>#### Week 3</summary>

We have 25 short mini-tasks for week 3.  You will only get a pass or fail for today's lab sessions.  You do not need to do all of these mini-tasks to pass today's hands-on lab examination.

It is very important for you to work through these hands-on lab tasks, very slowly, so that you fully understand and and every command in detail.  If you need help, try asking ChatGPT and your study buddy for help, or ask Teacher Todd, if that does not help.

Please only copy and paste one command at a time, so that if there is an error, you know which statement caused the error.  Also, if you get an error, do the following:


```
# enable bash debugging mode for more verbose output
set -x

# then enter the command that caused the error

# disable bash debugging
set +x

# then email the error and debugging information to Todd.Booth@Ltu.se
```

<details>
<summary>Task 1 - Via local client vs code, open a remote Linux directory</summary>

You need to login to your AWS Academy account and start the lab.  It takes about two minutes for the Ubuntu server to start and become ready to accept SSH connections.

It is very IMPORTANT to understand that there are four types of shells that you will be working with, and you need to understand which one to use for a given problem.  If you use the wrong one for a given problem, the commands might not work.

1. Client - "external local bash shell"
2. Client - "vs code local shell"
3. Ubuntu - "external remote bash shell"
4. Ubuntu - "vs code remote bash shell"

Normally, you only need 2. and 4., so I suggest you try to avoid 1. and 3.  I suggest that in vs code, you do the following:

1. Start vs code
2. Open a local folder, ~/source (the vs code > menu > view > terminal will be a local (2. Client) shell)
3. Open a remote Ubuntu aws-academy folder, ~/source (the vs code > menu > view > terminal will be a local (4. Ubuntu) shell)

I suggest that you always keep the above folders and termials open and available, so you can quickly switch back and forth between the two shells you will be using all the time.

Here is how to start the four shells, if you need to:

1. Client - "external local bash shell": On Windows, after installing Git for Windows, you can use the Windows key and type "git", and choose "Git Bash". On MacOS, you can start a "terminal", and you'll have a zsh shell, but you can use that when I say "bash shell".
2. Client - "vs code local shell": After you start vs code, you can open a file or folder on your client.  I suggest that, from the client, you open the folder, "~/source", and always have it availabe to edit files.  Then when you choose menu > view > terminal, you will get a "vs code local shell".  On Windows, from that shell, you can type the command "code file" to open any file into the vs code editor.  Unfortunately on MacOS, I don't think that the "code file" command works. 
3. Ubuntu - "external remote bash shell": To get this shell you need to first get a 1. Client - "external local bash shell", and from that shell, do an "ssh aws-academy".
4. Ubuntu - "vs code remote bash shell": To get this shell you need to first get a 2. Client - "vs code local shell", and from that shell, do an "ssh aws-academy".

You need to read the following instructions very carefully so see which bash shell (1-4) you should enter the command from.  If something goes wrong, double check to see if you entered the commands in the right shell.

Start the following shell: 2. Client - "vs code local shell"

Verify that ssh is working, to connect to your aws-academy Ubuntu server.

```
ssh aws-academy

# If the above works, it will put you into an Ubuntu server bash shell.  If you want, you can exit the shell with the following command:
exit
```

If the above fails, verify that the SSH server is listening with the following command:

```
nping --tcp-connect -p 22 -c 1 -H {your_public_ip_address}
```

From your client, via vs code, open the directory /home/ubuntu on your Ubuntu server.

1. Start vs code
2. Click on the "><" symbol in the lower left of vs code.
3. Choose connect current window to host
4. Choose your aws-academy SSH config entry
5. Choose open folder
6. You can open the default directory, /home/ubuntu/

</details>

<details>
<summary>Task 2 - Create the user teacher_todd on your Linux server</summary>

Create the user teacher_todd on your Ubuntu server.

Use the following shell: 2. Client - "vs code local shell"

```
sudo adduser --disabled-password --gecos "" teacher_todd
```
Verify that the home directory was created.

```
ls -l /home/
```

</details>

<details>
<summary>Task 3 - Create your remote Linux directory structure</summary>

Create the Ubuntu directory structure

Use the following shell: 4. Ubuntu - "vs code remote bash shell"

It is normal to receive an error if the directory(s) already exist.
Enter the commands one at a time, so that you can see if there is an error.

```
# check if the directory exists
ls -l ~/source/secrets/ssh

# if it does not exist, create it
mkdir -p ~/source/secrets/ssh

# check if the director exists
ls -l ~/source/repos

# if it does not exist, create it
mkdir ~/source/repos

# check if the directory exists
ls -l ~/source/bin

# if if does not exist, create it
mkdir ~/source/bin
```

</details>

<details>
<summary>Task 4 - Copy your private key to your Ubuntu server</summary>

We will soon need to authenticate to GitHub from the Ubuntu server, so you need to copy your private key, from your client to your server.  

```
Use the following shell: 2. Client - "vs code local shell"

# change to your secrets/ssh directory
cd ~/source/secrets/ssh

# List the files
ls -l

# Copy your private key to the server, and place the file in source/secrets/ssh/.
# The "." is a shortcut, so that you don't need to type in the whole file name again
scp keypair_1001_rsa aws-academy:source/secrets/ssh/.
```
</details>

<details>
<summary>Task 5 - Create your Ubuntu server based .ssh/config file</summary>

Use the following shell: 4. Ubuntu - "vs code remote bash shell"

Do the following:

```
# Verify that the scp worked and copied the private key to your server
ls -l ~/source/secrets/ssh/*

# Change the private key permissions, to prevent other users on the Ubuntu from accesing your private key
chmod 600 ~/source/secrets/ssh/keypair_1001_rsa

# Look at the new permissions
ls -l ~/source/secrets/ssh/*

# Copy the following GitHub.com ssh configuration to your clipboard

# This is so that you can authenticate to GitHub
Host github.com
    HostName GitHub.Com
    User git 
    StrictHostKeyChecking no
    IdentityFile ~/source/secrets/ssh/keypair_1001_rsa

# Edit (or create) your ssh config file (and paste the above into it.  Then save the file.)
code ~/.ssh/config

# save the file (Ctrl+S)
```

</details>

<details>
<summary>Task 6 - Authenticate to GitHub.com</summary>
Use the following shell: 4. Ubuntu - "vs code remote bash shell"

Do the following:

```
# authenicate to github.com
ssh github.com 
```

If the above fails, try to debug it with the following extra debugging information:

```
# Double check the ssh config
cat ~/.ssh/config

# Double check if the keypair exists
ls -l ~/source/secrets/ssh/keypair_1001_rsa

# authenicate to github.com
ssh -v github.com 
```

If you can't figure out the problem, you can send Teacher Todd an email with the above extra debugging information.

</details>

<details>
<summary>Task 7 - Clone the a7011e repository to your Ubuntu Server</summary>

Use the following shell: 4. Ubuntu - "vs code remote bash shell"

You will need to clone or pull the latest changes, to your Ubuntu server, to get the public key, as follows:

Do the following:

```
# authenicate to github.com
ssh github.com 

cd ~/source/repos

# if you didn't do this before on the Ubuntu server, please do it now
git clone git@github.com:ToddBooth/a7011e.git

# if you did the clone in the past, you need to get the updates from time to time with the following:

# Note that for git pull to work, you need to be in the directory/repository, which you want to update.
cd ~/source/repos/a7011e
git pull
```
</details>

<details>
<summary>Task 8 - Add teacher_todd's public key to Todd's directory</summary>
Use the following shell: 4. Ubuntu - "vs code remote bash shell"

Add Teacher Todd's public key to the file named /home/teacher_todd/.ssh/authorized_keys

Teacher Todd's public key is found in ~/source/repos/a7011e/secrets/ssh/todd_2023-10-09_rsa.pub

You can do the above with the following commands:

```
# using ~teacher_todd will refer to user teacher_todd's home directory, which is /home/teacher_todd

# verify that the user exists
grep teacher_todd /etc/passwd

# create the .ssh directory
sudo mkdir ~teacher_todd/.ssh

# change the .ssh directory permissions
sudo chmod 700 ~teacher_todd/.ssh

# change the .ssh directory owners
sudo chown teacher_todd:teacher_todd ~teacher_todd/.ssh

# append the public key to the authorized_keys file
sudo rm ~teacher_todd/.ssh/authorized_keys
sudo cat ~/source/repos/a7011e/secrets/ssh/todd_2023-10-09_rsa.pub | sudo tee -a ~teacher_todd/.ssh/authorized_keys

# see if the destination file exists
sudo ls -l ~teacher_todd/.ssh/authorized_keys

# change the file owner
sudo chown teacher_todd:teacher_todd ~teacher_todd/.ssh/authorized_keys

# change the file permissions so that only the user ubuntu can read and write to the file
sudo chmod 600 ~teacher_todd/.ssh/authorized_keys

# look at the owner permission results (rw for just the owner)
sudo ls -l ~teacher_todd/.ssh/authorized_keys
```
</details>

<details>
<summary>Task 9 - Add teacher_todd to visudo</summary>

Updating vidsudo will allow Teacher Todd to have escalated rights, such as the power of sudo.
Please add teacher_todd to the sudo group, with the command add_sudo.sh.

```
# if needed, authenticate to GitHub
ssh github.com

# make sure that you have the latest version of the respository
cd ~/source/repos/a7011e
git pull
```

# change the script permissions to allow execution
chmod +x ~/source/repos/a7011e/bin/add_sudo.sh

# execute the script
sudo ~/source/repos/a7011e/bin/add_sudo.sh
```
</details>

<details>
<summary>Task 10 - Update your path, to include your local scripts.</summary>

Add the following paths to the Ubuntu PATH environment variable, via the .bashrc file

```
# add ~/source/bin/ and ~/source/secrets/bin/ to the PATH
echo 'export PATH=$PATH:~/source/bin/:~/source/secrets/bin/' >> ~/.bashrc
```

```
# Source .bashrc so that it takes effect immediately
source ~/.bashrc
```

```
# Verify that the directories were added to your path
echo $PATH
```

</details>

<details>
<summary>Task 11 - Install nmap on the Ubuntu server</summary>

Nmap includes the command nping, which is very helpful for security and network troubleshooting.

```
# Install nmap on the Ubuntu server
sudo apt install -y nmap
</details>

<details>
<summary>Task 12 - Verify that the Ubuntu server is listening on port 22</summary>

Verify that the Ubuntu server is listening on port 22.  Since you are on the server, you will use the loopback interface, 127.0.0.1.

```
# test the port
nping --tcp-connect -p 22 -c 1 -H 127.0.0.1

# look for a "success", not a "failure"
```

</details>

<details>
<summary>Task 13 - Check if the Ubuntu server is listening on port 22 another way</summary>

```
# Execute the following and look for 0.0.0.0:22, which means the Ubuntu sever is listening on all IPv4 IP addresses
ss -tln
```

</details>

<details>
<summary>Task 14 - Use grep to make it easier to find text, in the output of "ss -tunl"</summary>

```
# Execute the following and look for 0.0.0.0:22, which means the Ubuntu sever is listening on alll IPv4 IP addresses
ss -tln | grep 0.0.0.0:22

# The output should only include the fact that the server is listening on port 22, on all IPv4 IP addresses (0.0.0.0)
```
</details>

<details>
<summary>Task 15 - Add a firewall rule to allow traffic from anywhere</summary>

Add a new rule to your AWS default security group firewall, to also allow traffic to port 61233, from anywhere

1. Login the web based AWS Management Console
2. Chose the EC2 service
3. On the left click on Instances > Instances
4. Click on your "Instance ID" blue link
5. Click below on the "Security" tab
6. Click below on your firewall (Security groups > sg-xxx blue link)
7. Click on the lower right "Edit inbound rules"
8. Click on the left left "Add rule"
9. Leave the "Type" to "Custom TCP"
10. Change "Port range" from "0" to "61233"
11. In the "Source Info" column, at the bottom, where it says "Custom", leave that and in the box to the right enter, "0.0.0.0/0".
12. In the "Description - optional", enter "SSH from anywhere to port 61233"
13. In the bottom right, choose "Save rules"

</details>

<details>
<summary>Task 16 - Change the OpenSSH server to listen on port 61233</summary>

By default, the SSH Servers listen for incoming connections on port 22.
As Teacher Todd said in class there are millions of robots trying to hack into SSH Servers on port 22.
So, to protect our IT Infrastructure, you should change the listening port, to something other than port 22.
In this task, you will have the server listen on port 61233.
If we make a mistake, we might lock ourselves out of the server, which makes is difficult to solve the problem.

So, we will still listen on port 22, but we will change is to ALSO listen on port 61233.
After we get port 61233 working, we will change it to stop listening on port 22.

```
# Do the following from the Ubuntu shell (vs code > connect to aws-academy > menu > view > terminal)

# change to your home directory
cd

# cp the ssh configuration file locally, so that you can edit it
cp /etc/ssh/sshd_config .

# verify that the file was copied
ls -l sshd_config

# look for the Port commands in the configuration file
grep Port sshd_config

# The output should be the following:
#Port 22
#GatewayPorts no

# There are two ways to edit the file, via an interactive editor or via a non-interactive command.

# DevSecOps is all about automation of security controls, so we'll use the non-ineractive command strategy.

# Here is a script to provide a solution

# Be sure to just copy and paste one line at a time, which makes troubleshooting must easier

# set a variable with the file name, to simplify the script
file='/etc/ssh/sshd_config'

# create a backup of the original file, which is a good practice
sudo cp $file $file.bkup

# make sure that the backup was created
ls -l ${file}*

# Change the "#Port 22", from being a comment to being an actual configuration line
sudo sed -i '/^#Port 22/s/^#//' $file

# Add the "Port 61233", after the "Port 22" line
sudo sed -i '/^Port 22/a Port 61233' $file

# Compare the new file with the backup file
diff $file $file.bkup

# Grep for the lines with "Port" in them, which is another way to check if the changes worked
grep Port $file
```
</details>

<details>
<summary>Task 17 - Restart the SSH to listen on port 61233</summary>

If we just change the SSH configuration file, it will not take immediate effect.

```
# First, let's see what ports that the SSH server is listening on, but just for IPv4
ss -tln | grep 0.0.0.0:22
ss -tln | grep 0.0.0.0:61233

# From the above, you see that it is listening on port 22, but not 61233

# We could reboot the server to have the changes, but that it not a good solution, since there is no need to reboot the server, which can cause other problems if the server is in use.  So, we will just restart the SSH service.

# You should not, but there is always a possibility that you will lose your ssh connections to the server, so it is a good practice to save any vs code Ubuntu server files

# We need to precede the following command with "sudo" since this is a privileged command.
sudo systemctl restart ssh

# Then let's check again, which ports the SSH server is listening on
ss -tln | grep 0.0.0.0:22
ss -tln | grep 0.0.0.0:61233

# You should see the following output (without the #):
# LISTEN 0      128          0.0.0.0:22         0.0.0.0:*
# LISTEN 0      128          0.0.0.0:61233      0.0.0.0:*
```
</details>

<details>
<summary>Task 18 - Test ssh to the new port and use it, if it works</summary>
Now we will test ssh'ing to the new port 61233.

Use the shell Client - "vs code local shell"

You need to modify your local client's ssh config file.

However, do not just change the existing stanza port number from 22 to 61233.
Instead create a brand new stanza, so that you have the old and new stanzas, as follows:

```
# ~/.ssh/config

Host aws-academy
	HostName 54.205.197.xx
	User ubuntu
    Port 22
    StrictHostKeyChecking no
    IdentityFile ~/source/secrets/ssh/labsuser.pem

Host aws-academy-61233
	HostName 54.205.197.xx
	User ubuntu
    Port 61233
    StrictHostKeyChecking no
    IdentityFile ~/source/secrets/ssh/labsuser.pem

# This is so that you can authenticate to GitHub
Host github.com
    HostName GitHub.Com
    User git 
    StrictHostKeyChecking no
    IdentityFile ~/source/secrets/ssh/keypair_1001_rsa
```

Now let's test the new server port

```
# Verify that the server is listening and that we can get past the firewall
nping --tcp-connect -p 61233 -c 1 -H {your_ubuntu_ip_address}
```

Look for a "success" and not a "failure" in the previous command.  If you get a "failure", please double check your AWS firewall (Instance security group).

```
# verify that ssh works from the client to aws-academy-61233
ssh aws-academy-61233

# If the above works, remove the port 22 from the ssh configuration file
# However, first save your files in vs code with Menu > File > Save All (or Save)

file='/etc/ssh/sshd_config'
sudo sed -i 's/^Port 22/#&/' $file

# Verify that the server will still listen on port 61233
grep Port $file

# Restart the ssh service
sudo systemctl restart ssh

# Execute the following and look for 0.0.0.0:xx, to see which ports the Ubuntu sever is listening on, for all IPv4 IP addresses.  It should now only listen on port 61233
ss -tln | grep 0.0.0.0:22
ss -tln | grep 0.0.0.0:61233

# You can now exit the Ubuntu shell and return to your local client shell
exit

# Verify that you can no longer reach port 22
nping --tcp-connect -p 22 -c 1 -H {your_ubuntu_ip_address}

# Verify that you can now ssh in, with the new ssh configuration entry
ssh aws-academy-61233
```

If the above works, change your local client ~/.ssh/config file to the following.  You will remove the test "aws-academy-61233", and change the "aws-academy" port to 61233.  Then you can just use "ssh aws-academy" and "vs code" connect to "aws-academy", which seems more natural.
```
# ~/.ssh/config

Host aws-academy
	HostName 54.205.197.xx
	User ubuntu
    Port 61233
    StrictHostKeyChecking no
    IdentityFile ~/source/secrets/ssh/labsuser.pem

# This is so that you can authenticate to GitHub
Host github.com
    HostName GitHub.Com
    User git 
    StrictHostKeyChecking no
    IdentityFile ~/source/secrets/ssh/keypair_1001_rsa
```
</details>

<details>
<summary>Task 19 - Test accessing the remote Ubuntu server, via the local vs code client</summary>

Previously, you used vs code to connect to the remote Ubuntu server, via port 22.  Now, you will verify that you can use vs code to connect the Ubuntu server via port 61233.  

1. First close the previous vs code window which connects to the old aws-academy .ssh config stanza.
2. Then click on the lower left (<>)
3. Then choose "Connect to Host"
4. Choose "aws-academy" (which should use the new port 61233)
5. Open the folder "/home/ubuntu/source".

</details>

<details>
<summary>Task 20 - Create a bash script to help perform AWS authentication</summary>

Use the following shell: 4. Ubuntu - "vs code remote bash shell"

Create a bash_init.sh script in ~/source/secrets/bash_init.sh and put in your AWS credentials

```
#!/bin/bash

# ~/.bashrc for linux and MacOS
# ~/.bash_profile for Windows GitBash

export HISTCONTROL=$HISTCONTROL:ignorespace
alias a="alias"

# function
# With this function you can just write "push" from your repo home directory, to do the following:
# git add .; git commit -m "commit message which is an argument"; git commit
push() 
{
  git add .
  if [ "$1" ]; then
    echo "You provided a commit argument: $1"
    git commit -m "$1"
  else
    git commit -m "unnamed_commit"
  fi
  git push
}

# Course information
export COURSE="a7011e"

# Student information (change it to your own information)
export STUDENT_NAME="Teacher Todd"
export STUDENT_ID="todboo-7"

# git and GitHub Configuration (change it to your own information)
export GITHUB_USERNAME="ToddBooth"
export GITHUB_EMAIL="todd.booth@ltu.se"

git config --global user.name $GITHUB_USERNAME
git config --global user.email $GITHUB_EMAIL
git config --global init.defaultBranch main
git config --global url."git@github.com:".insteadOf "https://github.com/"
git config --global core.autocrlf input
git config --global core.eol lf
git config --global push.default current

# AWS Academy
# Every time you restart your AWS Academy lab, you need to copy your own three credentials from:
# Modules > AWS Academy Learner Lab > Launch AWS Academy Learner Lab > "AWS Details" > "AWS CLI" > "Show", but don't copy the 1st line "[default]", to the following script:

# Copy to here from AWS Academy, after every lab restart, to gain access to the AWS cli credentials
aws_access_key_id=ASIAXB75xxxx
aws_secret_access_key=abCP3zWQc//UkshCRhRWVLuxxxx
aws_session_token=FwoGZXIvYXdzEAYaDFaGQYkDUjfwXYxxxx

# Then my following script commands will export the environment variables from the above, into the right names
export AWS_ACCESS_KEY_ID="$aws_access_key_id"
export AWS_SECRET_ACCESS_KEY="$aws_secret_access_key"
export AWS_SESSION_TOKEN="$aws_session_token"

 # You should then remove the unused environment variables
 unset aws_access_key_id
 unset aws_secret_access_key
 unset aws_session_token
```

Now change the script to be executable, and restrict the permissions:

```
chmod 700 ~/source/secrets/bash_init.sh
```

Now edit the file and add your AWS Academy credentials (if you have not already done this)
Modules > AWS Academy Learner Lab > Launch AWS Academy Learner Lab > "AWS Details" > "AWS CLI" > "Show", but don't copy the 1st line "[default]", to the following script:
```
code ~/source/secrets/bash_init.sh
```

Now execute the script
```
~/source/secrets/bash_init.sh
```
</details>

<details>
<summary>Task 21 - Install the AWS cli</summary>

Use the following shell: 4. Ubuntu - "vs code remote bash shell"

It can take hours and hours to implement IT Infrastructure Security, so the new trend is DevSecOps, which puts a big emphasis on automation.  One way to configure AWS public security controls, is by using a web browser and pointing and clicking, but that can take hours, so in this course you will learn DevSecOps automation, via bash scripts and via Python scripts.  To use the AWS cli via bash scripts, you need to first install the AWS cli on your Ubuntu server, which you will do now.

```
sudo apt install -y awscli
```

Now check if your AWS credentials have been set.
```
aws configure list
```

You should see something like the following:

```
Name                    Value             Type    Location
      ----                    -----             ----    --------
   profile                <not set>             None    None
access_key     ****************GMPH              env    
secret_key     ****************Pf9X              env    
    region                us-east-1              env    AWS_DEFAULT_REGION
```
</details>

<details>
<summary>Task 22 - Test AWS cli authentication</summary>

Use the following shell: 4. Ubuntu - "vs code remote bash shell"

Based on the above tasks, you should now be able to authenticate to the AWS Academy and run AWS cli commands.  We will test that now.

Run a simple test, to list your AWS S3 buckets.  You should not have any, so you will get no output.  However, if you can't authenticate, you will get an error message, like the following:

"An error occurred (ExpiredToken) when calling the ListBuckets operation: The provided token has expired."
```
# List your AWS s3 buckets, if you have any they will be listed (otherwise no output which is fine).
aws s3 ls
```
</details>

<details>
<summary>Task 23 - Create an AWS s3 bucket, from the AWS cli</summary>

Use the following shell: 4. Ubuntu - "vs code remote bash shell"

We will now use the AWS cli, to create an AWS s3 bucket (which is object storage).
```
aws s3 mb s3://teacher-todd
```

Now list the buckets, to verify it was created
```
# List your AWS s3 buckets
aws s3 ls
```
</details>

<details>
<summary>Task 24 - Create a bash script, to list your AWS s3 buckets</summary>
You were able to use the AWS cli command to list your buckets, but SecDevOps is all about implementing security via automation, with bash scripts and Python scripts.  So, now you will write a bash script to list your AWS s3 buckets.

Use the following shell: 4. Ubuntu - "vs code remote bash shell"

Create the following script and execute it.

```
# open the file for editing in vs code, from the command line
code ~/source/bin/aws_s3_list.sh
```

Add the following lines to the bash script
```
#!/bin/bash
aws s3 ls
```
Save the file with Ctrl+S

Change the script's permissions, so that it is executable.
```
chmod +x ~/source/bin/aws_s3_list.sh
```

You should already have the ~/source/bin/ directory in your path, but Linux will not notice your added script, until you do the following:

```
hash -r
```

The following should now work.

```
aws_s3_list.sh
```

However, if the above does not work, then there is a problem in your .bashrc settings file (based on an above task).  So, try fixing your path based on the previous task. If you can't figure out how to solve it, send me an email and here is a workaround in the meantime:

```
~/source/bin/aws_s3_list.sh
```
</details>

<details>
<summary>Task 25 - AWS Academy Foundations > Module 4 > Lab 1</summary>
This task is specifically related to the AWS Academy Foundations > Module 4 > Lab 1 - Introduction to AWS IAM hands-on lab.  In that task you added a user to a group.  We will do some related tasks.

I just wanted to mention that with this limited AWS Academy account, you are not allowed to add users, add groups, or add users to groups, so we can't write scripts for this.

If you could add users, you could have done the following:

Use the following shell: 4. Ubuntu - "vs code remote bash shell"
```
aws iam create-user --user-name teacher-todd
```
</details>

<details>
<summary>Task 26 - AWS Academy Foundations > Module 5 > Lab 2</summary>
This task is specifically related to the AWS Academy Foundations > Module 5 > Lab 2 -  - Build your VPC and Launch a Web Server hands-on lab.  In that task you added a user to a group.  We will do some related tasks.

When you create an AWS account, you will have a default VPC (virtual private cloud) build for you, and you can use that for many tasks.  However, we will create a new VPC.  A warning is that it will print out a lot of information, and it can be helpful to save the information, so we will save the output into a file.  The output is in json format (take the time and learn about that now).  So, we will save the output to the file named "~/aws_vpc.json"

```
# change to your home directory
cd

# Create the VPC and capture the VPC ID
VPC_ID=$(aws ec2 create-vpc --cidr-block 10.0.0.0/16 --query 'Vpc.VpcId' --output text)

# Tag the VPC with a name
aws ec2 create-tags --resources $VPC_ID --tags Key=Name,Value=MyVpc101

# describe the vpcs
aws ec2 describe-vpcs
```

</details>

<details>
<summary>TBD</summary>

</details>

