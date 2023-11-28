<details>
<summary>Task 500 - Possible "git pull" error message</summary>
After you clone the course a7011e repository, you should not edit your ~/source/repos/a7011e/. files.

If you do edit your ~/source/repos/a7011e/. files, the next time you to a "git pull", you may get an error stating that there is a conflict.  Here is one way to solve the error:

Change to your ~/source/repos directory
```
cd ~/source/repos
```

Rename the directory
```
mv a7011e a7011e.bkup
```

Do a new clone
```
# You might need to authenticate with "ssh github.com"
git clone git@github.com:ToddBooth/a7011e.git
```

Copy the scripts to your scripts directory
```
cp a7011e/bin/*.sh ~/source/bin/.
```

Make the scripts executable
```
chmod +x ~/source/bin/*.sh
```

If you need any of your changes from your a7011e.bkup, you will have access.

When you know that you no longer need your old directory, you can delete it.
```
rm -rf ~/source/repos/a7011e.bkup
```

If the following tasks don't state otherwise, please:

1. Start vs code
2. Click on the lower left to connect to your remote aws-academy server
3. Open ~/source on the remote aws-academy server
4. Start up a terminal from the remote aws-academy server vs code window

</details>

<details>
<summary>Task 501 - Study the AWS Secuirty material</summary>
Study the AWS Security material found in Canvas > Modules > Week 4 > "Week 4, Learn AWS Organizations, IAM, and Idenity".
</details>

<details>
<summary>Task 502 - Create the main high-level script</summary>

We created a low-level script and we manually entered the invokation via bash shell commands.  Now, we will create the high level script to invoke the low-level script.

We will call the high-level script create_infrastructure.sh.  It has been provided to you in the course a7011e repository, but you need to copy it to your ~/source/bin/.
```
# the following will copy all scripts
cp ~/source/repos/a7011e/bin/*.sh ~/source/bin/.
```

```
# Make all scripts executable
chmod +x ~/source/bin/*.sh
```

Rehash so that bash can find the scripts
```
hash -r
```

Study the script, so that you fully understand every single line of code.  If needed, please ask ChatGPT to provide a detailed explanation.

Before executing the script, we are going to remove all of the existing VPC's except we will not remove the default VPC, so execute the following, after you read it and understand it.

```
# Delete the three IT Infastructure network AWS VPCs (Development, Testing, and Production)
delete_all_vpc.sh
```

So, to create the Development IT Infrastructure VPC, enter the following command:

```
create_infrastructure.sh
```

Now, get a list of all of the VPCs, to verify that the Development VPC was created.
```
# learn what the grep command and argument is doing
aws ec2 describe-vpcs | grep -E 'VpcId|IsDefault|0.0/16|Value'
```

</details>

<details>
<summary>Task 503 - Create the Web server firewall rules</summary>

In the above tasks, we started to create an IT Infrastructure (and planned to add security controls), but we only created the VPC.  When you add AWS EC2 instances to a VPC, you need to specify which firewall rules (security group), you will use.  When you add Web servers, you may use one security group (firewall), but when you add database servers, you will configure an entirely different set of firewall rules.  So, in this task, you will create the security group (firewall) to be used by the Web servers.

When you have a lot of similar tasks, it is a good idea to use SecOps, SecDevOps, IaC (Infrastructure as Code), and automate it.  However, creating the security groups (firewall) for the three VPCs (Dev, Test, Prod) is not much work, so for now, you will create just the "Test" security group (firewall) for the Web servers, via the AWS Management Console (web pages), which is also a very important skill.

Please create a new security group (firewall) as follows:

1. Name: Web Servers
2. Adding a description is mandatory when creating a security group in AWS.  Please include your student-id in your description.
3. Rule: Allow incoming TCP traffic with destination port 80 (http) from anywhere (0.0.0.0/0)
4. Rule: Allow incoming TCP traffic with destination port 443 (https) from anywhere (0.0.0.0/0)
</details>

<details>
<summary>Task 504 - Login via AWS IAM Identity Center</summary>
I've created an AWS organization, which consists of ten distinct AWS accounts.  I'll give a demonstration of this on Tuesday, the 28th.  Some of the important things to learn about AWS organizations, is that you can create a tree structure and configure limited authorization, based on what are called AWS organization SCP's (service control policies).

It can be very tedius to create users, groups, and policies, on each account, since sometimes a given user should have similar rights on perhaps three different AWS accounts.  AWS came up with a solution to this problem called AWS IAM Identity Center, which you learned about in task 501.

I've created an AWS IAM Identity Center local user, group, and policy repository, so all of you now have accounts.  For this week five, I've added you to just one of the ten AWS accounts.  In week six, I'm planning to authorize you to access two more AWS accounts.

Also, I've given you AWS administrator rights, on my own AWS account.  However, to prevent the costs from occuring, for example EC2 costs, I've enabled some security, to only allow you to use AWS S3 buckets, for the time being.

Here is how to login:

1. These are directions for Google Chrome.  If you use another web browser, you will need to make changes to the following.
2. Google Chrome has a problem, and does not allow you to login to AWS in two different ways, in the same Web browser, and they even have problems with multiple Chrome tab incognito AWS logins conflicting.  So, I recommend using the Chrome > Menu > Account > Add > Continue without an account > then name it something like "IAM IC {student_id}".  Then in that new tab, login as follows:

1. url: https://d-c3671ffba8.awsapps.com/start
2. user_id: "a7011e-{student_id}"
3. pw: After you enter your user_id, it should send an email to your LTU student email account, and provide a URL to setup your password.  If it does not, click on the "Forgot password" link, to get the email.
4. Once you login, click on Accounts
5. Then click on the only available account, "Test x8357", which is the AWS account that we will use for testing.
6. Then click on the permission set named, "Administrators".  Normally you would have full permissions, but Teacher Todd setup an AWS Organizations with Service Control Policies, to greatly limit your rights.  Todd will discuss this in class.  For example, you can't create EC2 instances, so just keep using your AWS Academy account to create free EC2 instances.
7. Surf to the AWS S3 service, and list the buckets, which should work fine.
8. Create a bucket with the following name, "{your_student_id}-test-01".  Leave the "Block all public access" setting enabled, to prevent public access.  You can use all the other defaults.  I might delete all buckets, so it you create bucket objects, you should be sure and have a local copy of the bucket objects.
</details>

<details>
<summary>Task 505 - Create an AWS IAM user</summary>
The AWS Academy Learner Lab course, with 100 USD in credits is great, and it is really useful to create and run expensive EC instances.  However, this class is all about IT Infrastructure Security, so you need to learn how to create AWS IAM users, groups, roles, and policies, which is not possible with the free AWS Academy accounts.

It took me many hours, but I found a solution.  Via the AWS IAM Identity Center, I've given you authorization to create users, groups, roles, and policies.  Even though you can create a user and give them full Administrator access, via the AWS Organization Service Control Policy (SCP), I can still limit and control what you are authorized to do, even when you login as the users that you create.

So, in this task, via the AWS Management Console, create a user, as follows:

1. Login, in a new Chrome account (as discussed previously), to your new AWS IAM Identity Center account
2. Surf to the "IAM" service
3. Click on the left, "Users".
4. Click on the upper right, "Create user"
5. Username: "{your_student_id}-user_01"
6. Click to enable, "Provide user access to the AWS Management Console - optional"
7. Use the default for, "Autogenerated password"
8. Disable (deselect), "Users must create a new password at next sign-in - Recommended"
9. On "Set permissions", leave the defaults, and click "Next", in the lower right
10. On "Review and create", click on "Add new tag", in the bottom left.
11. In the "Key" field, enter your user_id in all lower case.
12. Click "Create user", in the lower right
13. Verify that the user was created.
</details>

<details>
<summary>Task 506 - Create an AWS IAM group</summary>
Now you will create an AWS IAM group, and we'll also add the user to the group in task.  

1. Login, in a new Chrome account (as discussed previously), to your new AWS IAM Identity Center account
2. Surf to the "IAM" service
3. Click on the left, "User groups"
4. Click on the right, "Create group"
5. "Name the group": "{your_student_id}-group_01"
6. In the "Add users to the group", section, select the previous user that you created.
7. In the "Attach permissions policies - Optional", don't select anything
8. Click "Create group", in the lower right
9. Verify that the group was created.
</details>

<details>
<summary>Task 507 - Create an inline policy and attach it to your created group</summary>
TBD
</details>

<details>
<summary>Task 508 - In progress - AWS Code Pipeline</summary>

TBD: In this task, you will use the AWS Code Pipeline service, to automate your task.

</details>

<details>
<summary>TBD</summary>

</details>

