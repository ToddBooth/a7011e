Hello beta testers,

The new plan, is for beta testers to test all the tasks in this file, but please let me know ASAP when you find any issues to Todd.Booth@Ltu.se via email.  Thanks!

On Tuesday, we only have 90 minutes for the hands-on labs.  The other 90 minutes is for a mid-term examinations, so I think that I already have more than enough hands-on labs for 90 minutes, so I'm very interested to hear how long these hands-on labs take you.

Note, that the instructions refer to ~/source/repos/a7011e, but in the beta, the files are in ~/source/repos/a7011e_beta.

Thanks so much for your help!

Teacher Todd

<details>
<summary>Task 400 - Which shells to use</summary>

From now on, task number 40 means week 4, task 0.  You will now just report 400, 401, 402, etc. as the last task you completed.

The following includes repeated information from week 3, which was been improved.

It is very IMPORTANT to understand that there are four types of shells that you will be working with, and you need to understand which one to use for a given problem.  If you use the wrong one for a given problem, the commands might not work.

1. Ubuntu - "vs code remote bash shell"
2. Client - "vs code local shell"
3. Client - "external local bash shell" (this means, from outside vs code, you started a bash shell)
4. Ubuntu - "external remote bash shell" (this means, from your shell, you manually did an "ssh aws-academy")

Normally, you only need 1. and 2., so I suggest you try to avoid 3. and 4.  If you think the vs code terminal is too small, you can click on the terminal up arrow (upper right of terminal) to enlarge it then then the terminal down arrow to make it small again (upper right of terminal).

I suggest that in vs code, you do the following:

1. Start vs code
2. Open a remote Ubuntu aws-academy folder.  From vs code, you need to click on the SSH connect button (lower left, "<>"), chooce "Connect to Host", choose "aws-academy", and open the folder "~/source".  (the vs code > menu > view > terminal will be a "1. Ubuntu - vs code remote bash shell")
3. In Open a local folder, ~/source (the vs code > menu > view > terminal will be a "2. Client vs code local shell")

##### Getting "code file.txt" to work from the MacOS terminal

By default, vs code is not in the MacOS path, so here is how to add it to the path, so that "code file1.txt" works.  Here is the official [vs code Link](https://code.visualstudio.com/docs/setup/mac), to get that working.
</details>

<details>
<summary>Task 401 - Authenticate to AWS via an AWS role</summary>

From now on, whenever you need to execute shell command on the Ubuntu server, for any tasks, use the following shell:

1. Ubuntu - "vs code remote bash shell"

We are now changing to a new way to report your current completed task, in Canvas > Collaborations > Student Information.

Please keep in mind, that you always need to study all commands and all scripts, so that you FULLY understand each and every single line of code.  If needed, please ask ChatGPT to provide a detailed explaination.

In this task, you will authenticate to AWS on your Ubuntu server, via an AWS role.  This way, you don't need to keep updating your bash_init.sh script every time you re-start your AWS Academy hands-on lab.  

First, please take about 15 minutes to read about what an AWS role is, at this [AWS roles web page](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html).

Next, please update your ~/source/secrets/bash_init.sh script, as follows:

Comment out the following, by putting a "# " before each line.  The easiest way to comment out a bunch of lines in vs code is by first highlighting (selecting) all the lines, and then enter the keystroke (Ctrl + ').  If you highlight commented lines and hit the same keystroke, it will uncomment the lines.  Note that I don't want you to comment out the AWS region.  So, please comment out the following lines (except for "export AWS_DEFAULT_REGION='us-east-1'"):

To bring up the script in vs code, use the following command:

```
code ~/source/secrets/bash_init.sh
```

Then comment out the following:
```
# Copy to here from AWS Academy, after every lab restart, to gain access to the AWS cli credentials
aws_access_key_id=ASIAXB75xxxx
aws_secret_access_key=abCP3zWQc//UkshCRhRWVLuxxxx
aws_session_token=FwoGZXIvYXdzEAYaDFaGQYkDUjfwXYxxxx

# Then my following script commands will export the environment variables from the above, into the right names
export AWS_ACCESS_KEY_ID="$aws_access_key_id"
export AWS_SECRET_ACCESS_KEY="$aws_secret_access_key"
export AWS_SESSION_TOKEN="$aws_session_token"
export AWS_DEFAULT_REGION='us-east-1'

 # You should then remove the unused environment variables
 unset aws_access_key_id
 unset aws_secret_access_key
 unset aws_session_token
```

Then save the file with (Ctrl + s).  

Create the directory .aws if it does not exist.
```
mkdir ~/.aws
```

Verify that the directory was create.
```
ls -a ~
```

Create a file ~/.aws/config with the following region
```
[default]
region = us-east-1
```

if you have a ~/.aws/credentials file rename it (otherwise the role will be overriden)
```
mv ~/.aws/credentials ~/.aws/credentials.bkup

# Then exit the shell with:
exit
```

Then start a new shell (vs code > menu > View -> Terminal).

The verify that the "AWS Type" is "role", like the following:

aws configure list should run automatically but if not run it as follows:
```
aws configure list
```
So, here is the example output:

```
      Name                    Value             Type    Location
      ----                    -----             ----    --------
   profile                <not set>             None    None
access_key     ****************GAMT         iam-role    
secret_key     ****************O+lV         iam-role    
    region                us-east-1      config-file    ~/.aws/config
```

If in the above, you don't get type "iam-role", check your instance via the AWS management console:

EC2 > instances > click on the aws-academy instance blue link.

Then look on the left middle for "IAM Role" and it should say, "LabRole".  If it does not state this, then you didn't follow the instructions when you created the instance.  So, you need to set the role manually using the AWS cli.  I suggest you ask ChatGPT the following, to get the instructions:

```
How can I use the aws cli to add a role named "LabRole" to an aws ubuntu 22.04 server instance?
```

Now verify that you can authenticate to AWS and not receive an error with the following command, which might not provide any output: 

```
# this will list any aws S3 buckets
aws s3 ls
```
</details>

<details>
<summary>Task 402 - Learn about the AWS cli</summary>

Please take about 15 minutes to read about what the AWS cli is, at this [AWS cli web page](https://aws.amazon.com/cli/).  As you read it, try out a few commands.
</details>

<details>
<summary>Task 403 - Delete any unused VPC's</summary>

First, please take about 15 minutes to read about what an AWS VPC (Virtual Private Cloud) is, at this [AWS VPC web page](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html).

This class is all about IT Infrastructure Security.  To implement the security, we first need an IT Infrastructure, which consits of compute, storage, networking, and security.  When you create an instance (compute), you need to attach it to a VPC (Virtual Private Cloud), which will include a network. So we to decide which VPC to connect our future instances to.

Normally, a company will have at least three types of VPCs, one for development, one for testing, and one for production.  So, you will first create these three IT Infrastructure VPCs.

In this task, you will first delete any VPC's other than the default VPC.  Now, you are going to list your VPC's.  First verify that your AWS credentials have been set.
```
aws configure list
```

So, here is the example output:

```
      Name                    Value             Type    Location
      ----                    -----             ----    --------
   profile                <not set>             None    None
access_key     ****************GAMT         iam-role    
secret_key     ****************O+lV         iam-role    
    region                us-east-1              env    AWS_DEFAULT_REGION
```

Then you need to test the AWS cli, to see if you can authenticate, with the following.  Run a simple test, to list your AWS S3 buckets. If you don't have any, so will not receive any output.  However, you might have created a bucket like, teacher-todd-xxxx, so you might see that bucket.

However, if you can't authenticate, you will get an error.
```
# List your AWS s3 buckets, if you have any they will be listed (otherwise no output which is fine).
aws s3 ls
```

Now, list your VPC's, with the following:

```
aws ec2 describe-vpcs
```

You can see that there is a lot of information to look through, which takes time and leads to mistakes.  

So, I want you now to do the same command but just output the relevant information you need, such as tag ("Value"), "VpcId" and "IsDefault", which you can do with the following grep command:

```
aws ec2 describe-vpcs | grep -E 'VpcId|IsDefault|Value'
```

Please take some time until you learn and understand what the above grep command is doing.

The above command will output information, similar to the following:

```
    "VpcId": "vpc-0b5922a339ccf5467",
    "IsDefault": true
    "VpcId": "vpc-0cd528e74c4118b17",
    "IsDefault": false,
```

Please do NOT delete the default VPC, which is where is says, "IsDefault": true.  

Be cautious when performing actions that might impact your infrastructure. Deleting a VPC will also delete associated resources like subnets, route tables, and security groups. Always double-check and confirm before executing destructive commands.
 
If you have any other VPC's with "IsDefault": false, please delete those as follows (please change it to use your own VpcId):

```
aws ec2 delete-vpc --vpc-id 'vpc-03a903aa310c730b4'
```

If you delete a VPC, verify that it no longer exists, with the following command:
```
aws ec2 describe-vpcs | grep -E 'VpcId|IsDefault|Value'
```
</details>

<details>
<summary>Task 404 - AWS Academy Foundations > Module 5 > Lab 2</summary>

In the AWS Academy Foundations course, in module 5, lab 2, you created a VPC and launched a Web server into the VPC.  This course is about DevSecOps, which means we try to use something called Infrastructure as Code (IaC), to programmatically do this like create the VPCs, and programmically create the related security controls.

There was a small issue with the previous week 3 vesion of this task, since you need to specify the AWS region.  So, you need to repeat the lab, with the following additional information and instructions.  Above, in task 401, you've added the AWS region to your init script, so AWS authentication should now work fine.

When you create an AWS account, you will have a default VPC (virtual private cloud) built for you, and you can use that for many tasks.  However, we will create a new VPC.  A warning is that it will print out a lot of information.

The output is in json format.  Please take about 15 minutes to learn about the json format, from the following [Json Link](https://www.w3schools.com/whatis/whatis_json.asp).

Now, take about 15 minutes to learn what IP addressing is and what a TCP/IP subnet is via this [IP/Subnet Link](https://docs.aws.amazon.com/vpc/latest/userguide/configure-subnets.html).

Then take about 15 minutes to learn what a TCP/IP cidr is at this [Cidr Link](https://aws.amazon.com/what-is/cidr/#:~:text=Classless%20Inter%2DDomain%20Routing%20(CIDR)%20allows%20network%20routers%20to,specified%20by%20the%20CIDR%20suffix.).

It is important to learn what the $() does, in the following command: (don't execute the following yet)

```
# Create the VPC and capture the VPC ID
VPC_ID=$(aws ec2 create-vpc --cidr-block 10.0.0.0/16 --query 'Vpc.VpcId' --output text)
```

$() is utilized for command substitution, allowing the execution of commands and substitution of their output. 

You are now going to create three IT Infrastructure VPCs, one for Development, one for Testing, and one for Production.  Here are the -cidr-block's that you will use:

```
Development: 10.1.0.0/16
Testing:     10.2.0.0/16
Production:  10.3.0.0/16
```

Now execute the following:

```
# change to your home directory
cd
```

Notice how I'm using bash variables in the following, so that the code is easier to understand and to make it easier to reuse the idential code, when creating the other two VPCs.

##### Create the Development VPC

```
# Set the bash variables
cidr='10.1.0.0/16'
tag='Development'

# Create the VPC and capture the VPC ID
VPC_ID=$(aws ec2 create-vpc --cidr-block ${cidr} --query 'Vpc.VpcId' --output text)

# Tag the VPC with a name
aws ec2 create-tags --resources $VPC_ID --tags Key=Name,Value=${tag}
```

##### Create the Testing VPC

```
# Set the bash variables
cidr='10.2.0.0/16'
tag='Testing'

# Create the VPC and capture the VPC ID
VPC_ID=$(aws ec2 create-vpc --cidr-block ${cidr} --query 'Vpc.VpcId' --output text)

# Tag the VPC with a name
aws ec2 create-tags --resources $VPC_ID --tags Key=Name,Value=${tag}
```

##### Create the Production VPC

```
# Set the bash variables
cidr='10.3.0.0/16'
tag='Production'

# Create the VPC and capture the VPC ID
VPC_ID=$(aws ec2 create-vpc --cidr-block ${cidr} --query 'Vpc.VpcId' --output text)

# Tag the VPC with a name
aws ec2 create-tags --resources $VPC_ID --tags Key=Name,Value=${tag}
```

Now, get a list of all of the VPCs
```
aws ec2 describe-vpcs | grep -E 'VpcId|IsDefault|0.0/16|Value'
```

Based on the tag (Value) and the cidr output (ex: 10.3.0.0/16), you can see which of the VPC's it is, Development, Testing, or Production.  Now, let's get the full aws cli output for the Development VPC.  You need to use the VpcId, which is associated with the Development VPC.  So, change the VpcId to the value of your Development VPC id.

```
vpc_id='vpc-0cb64eacd2ba5f239'
aws ec2 describe-vpcs --vpc-ids $vpc_id
```

</details>

<details>
<summary>Task 405 - Delete a VPC via a script</summary>

Please never ever move on to a next hands-on lab task, until you have all of the previous hands-on lab tasks completed.  If needed, ask your study buddy, ChatGPT, or Teacher Todd for help if you are stuck.

When creating IT Infrastructure and related security controls, when things are not perfect, sometimes we just change things.  At other times, we often delete the whole IT Infrastructure, fix the problems in the scripts, and completely rebuild the IT Infrastructure, based on what is called  Infrastructure as Code (IaC), which is often used in DevSecOps.

Take about 15 minutes and study what is [DevSecOps](https://www.redhat.com/en/topics/devops/what-is-devsecops#:~:text=Red%20Hat's%20approach-,Overview,throughout%20the%20entire%20IT%20lifecycle.).

For this lab, you will write two DevSecOps IaC scripts:

1. A script to delete the three VPCs (Development, Testing, and Production)
2. A script to create the three same VPCs

In the bash scripts, we are going to use a json tool called, "jq", so you need to install that as follows:

```
sudo apt install -y jq
```

Now, take 15 minutes to learn about jq at this [jq Link](https://ioflood.com/blog/jq-linux-command/#:~:text=The%20jq%20command%20in%20Linux%20is%20a%20powerful%20tool%20for,%2C%20%7C%20jq%20%5Bcommand%5D%20.).

Pull the latest changes from the a7011e repository
```
cd ~/source/repos/a7011e
git pull
```

Now, copy the provided bash script, named: delete_hardcoded_vpc.sh to your ~/source/bin/.

```
cp ~/source/repos/a7011e/bin/delete_hardcoded_vpc.sh ~/source/bin/.
```

Then change the permission of the script, so that it is executable:

```
chmod +x ~/source/bin/delete_hardcoded_vpc.sh
```

rehash so that bash can find your new script

```
hash -r
```

Now, get a list of all of the VPCs
```
aws ec2 describe-vpcs | grep -E 'VpcId|IsDefault|0.0/16|Value'
```

Study the script, so that you fully understand every single line of code.  If needed, please ask ChatGPT to provide a detailed explaination.

Now, run the script to delete the hardcoded, "Development" VPC
```
# run the script
delete_hardcoded_vpc.sh
```

Now, get a list of all of the VPCs, to verify that the Development VPC was deleted.
```
aws ec2 describe-vpcs | grep -E 'VpcId|IsDefault|0.0/16|Value'
```

That's all for this hands-on lab.

</details>

<details>
<summary>Task 406 - Write a new script to delete all three VPCs</summary>

In the previous task, we hard-coded in the script to delete the Development VPC.  We could write two more scripts to delete the other two VPCs but that is not programming in the best way.  So, we will create one script, to delete all three VPCs.

We could simple duplicate the code three times, but in programming, that is not the best way to do things.  So, we'll create a bash function, and simply call the function three times, to delete three VPC's.

So, to learn the basics of bash functions, please take 5-10 minutes to review this [Bash Link](https://linuxize.com/post/bash-functions/).

So, what should be our next step?  We could edit the existing delete_hardcoded_vpc.sh script, however, that is not a good programming practice.  It is better to create a new script, get it working and then delete the old script.  That way during development of the new script, we can always look at the previous script that worked.  So, pelase copy this new script, delete_all_vpc.sh

Now, copy the provided bash script, named: delete_all_vpc.sh to your ~/source/bin/.

```
cp ~/source/repos/a7011e/bin/delete_all_vpc.sh ~/source/bin/.
```

Then change the permission of the script, so that it is executable:

```
chmod +x ~/source/bin/delete_all_vpc.sh
```

rehash so that bash can find your new script

```
hash -r
```

Now, get a list of all of the VPCs
```
aws ec2 describe-vpcs | grep -E 'VpcId|IsDefault|0.0/16|Value'
```

Study the script, so that you fully understand every single line of code.  If needed, please ask ChatGPT to provide a detailed explaination.

Now, run the script to try and delete the three VPC's (Development, Testing, and Production).  However, you earlier deleted the Development, so the script will only delete the Testing and Production VPC's (and the default VPC will remain).
```
# run the script
delete_all_vpc.sh
```

Now, get a list of all of the VPCs, to verify that the three VPC's were deleted.
```
aws ec2 describe-vpcs | grep -E 'VpcId|IsDefault|0.0/16|Value'
```

</details>

<details>
<summary>Task 407 - Write a new script to create all three VPCs</summary>

We have created VPCs from the command line, but now let's create the three VPCs from a single script, to automate, which is required in IaC, SecOps, and DevSecOps.  Also, we will use a common bash function to create all three VPCs, so that we do not duplicate code, which is a best practice, in programming.  Note that there are two required parameters, the tag and cidr.  We will call the script create_all_vpc.sh.  It has been provided to you in the course a7011e repository, but you need to copy it to your ~/source/bin/.
```
cp ~/source/repo/a7011e/bin/create_all_vpc.sh ~/source/bin/.
```

Make the script executable
```
chmod +x ~/source/bin/create_all_vpc.sh
```

Rehash so that bash can find the script
```
hash -r
```

Study the script, so that you fully understand every single line of code.  If needed, please ask ChatGPT to provide a detailed explaination.

Execute the script
```
create_all_vpc.sh
```
</details>

<details>
<summary>Task 408 - Change script to accept external arguments</summary>

You've run a script to create three VPC's for Development, Testing, and Production.  Often, the focus is first on Development, then in Testing, and then in Production.  However, it is a best programming practice, to develop the "Developer" IT Infrastructure IaC scripts, so that they can be reused to create the Testing and Production, IT Infrastructures, so we will now change our scripts to implement this strategy.

Our script only created the IT Infrastructure VPCs.  There is a lot of more IT Infrastructure to create.  We might need ten different scripts to create the entire IT Infrastructure.  We could manually edit the ten different scripts when we want to change from creating the Development IT Infrastructure to creating the Testing IT Infrastructure, however, there is a better way.  So, now you will learn the strategy to pass arguments to a script to customize what the script will do.  So, we could have the following, which allows us to just change one line of code in the script, to automatically create an entirelly different IT Infrastructure:

```
#!/bin/bash

type='Developer'
# type='Testing'
# type='Production'

create_vpc.sh $type
create_firewall.sh $type
create_web_servers $type
create_subnets.sh $type
create_route_tables.sh $type
create_internet_gateways $type
create_iam_roles $type
create_elastic_load_balancers $type
create_auto_scaling_groups $type
create_cloudwatch_monitoring.sh $type
# etc...
```

One issue with the above is that you can only have the scripts run for one of the "type"s, so a better way to write the above is by using a function, see ~/source/repos/a7011e/bin/create_all.sh:

With the create_all.sh script, we can run all the create scripts, for each of the different types (Developer, Testing, and Production).  Please study the script until you understand it 100%.
</details>

<details>
<summary>Task 409 - We will now create a relevant low-level script</summary>

In the last task, we showed you the high level script create_all.sh, which invokes low level scripts. Let's now create one of the low level scripts, named create_vpc.sh.  It is very similar to our previous script named create_all_vpc.sh, however we will have the following changes, and you need to fully understand these changes and why we are making these changes:

1. The script will accept an argument, which states which IT Infrastructure we are creating, for example, "Development", "Testing", or "Production".
2. The script will also accept an argument, which will be the CIDR subnet mask to use.
3. Based on the recived argument, the script will only create public cloud resources for that type of IT Infrastructure

We will call the script create_vpc.sh.  It has been provided to you in the course a7011e repository, but you need to copy it to your ~/source/bin/.
```
cp ~/source/repo/a7011e/bin/create_vpc.sh ~/source/bin/.
```

Make the script executable
```
chmod +x ~/source/bin/create_vpc.sh
```

Rehash so that bash can find the script
```
hash -r
```

Study the script, so that you fully understand every single line of code.  If needed, please ask ChatGPT to provide a detailed explaination.

Before executing the script, we are going to remove all of the existing VPC's except we will not remove the default VPC, so execute the following:

```
delete_all_vpc.sh
```

Now please execute the script, from the Linux cli, as a test, to create the "Development" VPC
```
create_vpc.sh 'Development' '10.1.0.0'
```
Now, get a list of all of the VPCs, to verify that the Development VPC was created.
```
aws ec2 describe-vpcs | grep -E 'VpcId|IsDefault|0.0/16|Value'
```

When you are satisfied that the above script works, you can move on.
</details>

