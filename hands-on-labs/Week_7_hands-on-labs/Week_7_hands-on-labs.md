<details>
<summary>Task 701 - Introduction</summary>
Here is the big picture. This is an introduction to the week 7 hands-on labs. Again, we are studing IT Infrastructure Security, and concerning AWS, here are a few of the IT Infrastucture services, including security services:

IT Infrastructure for on-premises and in the public clouds
1. Compute
2. Storage
3. Networking
4. Security

### AWS IT Infrastruture Services

##### 1. Compute
1. EC2 Instances
2. Lambda serverless functions
3. Docker container related services

##### 2. Storage
1. S3 buckets and object storage
2. EBS volumes for EC2 instances
3. RDS (relational SQL databases)
4. DynamoDB No-SQL

##### 3. Networking
1. Security groups (firewalls)
2. Amazon VPC (virtual private clouds)
3. Amazon Route 53 (DNS)
4. Amazon CloudFront - content delivery network (CDN)

##### 4. Security
1. IAM users, groups, and roles
2. IAM Policies
3. AWS Organizations
4. AWS IAM Identity Center
5. AWS WAF (Web Application Firewall)

##### 5. Security auditing and monitoring
1. AWS CloudTrail
2. AWS CloudWatch
3. AWS Config

</details>

<details>
<summary>Task 702 - Amazon Q</summary>
Review the Amazon Q documentation at this [Link](https://docs.aws.amazon.com/amazonq/latest/aws-builder-use-ug/amazonq-in-console.html).

Then try Q out.  When you give Q different questions during the hands-on labs, give some questions to [ChatGPT](https://chat.openai.com) or Bing Chat AI, and see which answers you like better. I sometimes use Q, sometimes Chat GPT and sometimes Bing Chat AI.
</details>

<details>
<summary>Task 703 - Set a root AWS Organization security policy (SCP)"</summary>
When you create an AWS Organization, all of the member accounts can do anything that they want and the AWS Oganization management account must pay all of those costs.  Even if you trust the users who have access to the account, hackers might access the account and cause huge costs, for example doing bitcoin mining, via EC2, Docker containers, or even AWS Lambda.  In general, this makes no sense at all, so you all need to learn how to control and prevent these possible vulnerability costs, and this will be on the final examination, since it is so important to learn.  Also, it will be a great addition to your cv/resume.

I want to give you a specific example, to help you understand the issues.  I've created an AWS Organization and I've given all of you access to just one AWS account for now, in the organization, to the "Test x5387" account.

In AWS Organizations, all of the costs for any sub-account in the organization, must be paid for the parent organiation, which is me in this case.  If I make a mistake in the security policies, and you, for example, start nemerous EC2 instances, I have to pay all of those costs.  So, please only do tasks that are documented in the hands-on labs.  If you want to do additional things, please contact me first and I'll see if I can allow that and not have huge costs.  If you notice that you have rights to do something that costs money, which are not in the hands-on labs, please let me know, so that I can fix that problem.

I highly recommend that you configure the following for your Organizations "Management" account, for root access.  I strongly recommend to enable IAM "root" access to be via MFA (multi factor authentication).  Then even if a hacker has a virus on your computer, and they can see the "root" credentials, they will not be able to login unless they also have access to your mobile phone.

To prevent any charges, even if a hacker logs into one of your AWS sub-accounts, you can setup the following AWS Organization SCP (service control policy), to limit what the hackers can do.  Note that this policy only applies to all of the Organization sub-accounts, not the "Management" account.  

1. Surf to the AWS "Organizations" service
2. Click on the left, "Policies"
3. Click on "Service Control Policies"
4. Click on "Enable service control polices"
5. Click on the right orange, "Create policy"
6. For the policy name, enter "Root_SCP_Policy"
7. In the policy area, select everything and delete it, so that there is nothing left.
8. In the policy area, copy and paste the following to the policy area:

```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "CommonServices",
      "Effect": "Allow",
      "Action": [
        "iam:*",
        "s3:*",
        "access-analyzer:*"
      ],
      "Resource": "*"
    },
    {
      "Sid": "s3GetObjectDeny",
      "Effect": "Deny",
      "Action": [
        "s3:GetObject"
      ],
      "Resource": "*"
    }
  ]
}
```

Here is a summary of what the above SCP policy means:

1. If a service is in the allowed Sid "CommonServices", and is not denied in the same policy, it will be, by default allowed, for all sub-accounts in the AWS Organization, unless the lower lever SCP denies the service.
2. However, when a service is not included in the allowed Sid "CommonServices", but it is not denied in any Deny rules, what happens then?
3. For this policy, if a service is not Allowed and not Denied, it will be denied, since a service rule must have an allow.
4. In the above policy, we have explicitly allowed some services and explictly denied other services.
</details>

<details>
<summary>Task 704 - Apply the Root_SCP_Policy SCP to the entire organization</summary>
After creating the Root_SCP_Policy SCP for the entire organization, you need to apply it to the root of the Organization, and I'll show you how now:

1. Login to your Management AWS Organizations account, in a new Web browser window
2. Surf to the AWS oganizations service
3. Click on the left, "Policies"
4. Click on "Service control policies"
5. Click on the "Root_SCP_Policy" policy
6. Click on "Targets"
7. Click on the lower right "Attach" button
8. Click and select on the "Root OU" button
9. Click on the lower right, "Attach policy" button
</details>

<details>
<summary>Task 705 - AWS IAM Policy Simulator</summary>
In this task, you will learn the AWS IAM Policy Simulator tool.

Please first read the information about the IAM Policy Simulator at this [Link](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_testing-policies.html).

Log into your AWS Organizations management account, in two different Web Browser windows.  In one window login as the root user, and login in the other window as the user Administrator.

Then you can access the IAM Policy Simulator Console at this [Link](https://policysim.aws.amazon.com/), in a new tab, where you are logged in as the user Administrator, in your AWS Organizations management account.

Try to learn on your own how to use the Policy Similary.  Try to run a test of all S3 services.  You should see permission allowed for all S3 tasks except S3:GetObject.  Experiment.  Also, jump back to the root user and change the Administrator policy, and then rerun tests.
</details>

<details>
<summary>Task 706 - AWS IAM Identity Center</summary>
Please first read the information about the IAM Identity Center at this [Link](https://aws.amazon.com/iam/identity-center/).

On your own, try to learn what all the features and functionality is of the IAM IC, and then create the IAM IC on your own, from your root user, in your AWS Organizations Management account.  You should create a "local" database store, not for example a Microsoft Active Directory database.  The "local" database store is created by default.
</details>

<details>
<summary>Task 707 - AWS IAM Identity Center - add one user</summary>
Here is the output of a program I wrote in C# to generate Linux bash commands to add a user, and add them to the required group.  Please study this so that you understand each line of the Bash AWS script:

```
member_id1=$(aws identitystore create-user \
      --region 'eu-north-1' \
      --identity-store-id 'd-c3671ffba8' \
      --user-name 'a7011e-amimar-2' \
      --name Formatted=string,FamilyName='Marteni',GivenName='Amin' \
      --display-name 'Amin Marteni' \
      --emails Value='amimar-2@Student.Ltu.se',Type=Ltu-a7011e,Primary=true \
      --preferred-language 'en-us' \
      --locale 'SE' \
      --timezone 'Europe/Stockholm'
    )
    
# Extract the second value
member_id2=$(echo $member_id1 | awk '{print $2}')

echo member_id2: $member_id2

aws identitystore create-group-membership \
      --identity-store-id d-c3671ffba8 \
      --group-id 40fc59bc-e061-7011-cf35-47fab24198cf \
      --member-id "UserId=$member_id2"
```

You do not need to execute the above script.
</details>

<details>
<summary>Task 708 - AWS IAM Identity Center - using bash variables</summary>
Now create and run your own script and here is a suggestion, on how to modify the script to use variables.

```
#!/bin/bash

# change the following, as needed, for your own envonrment.
# I have not tested this, so you may need to perform debugging on your own.
region='eu-north-1'

# replace with your identity_store_id:
identity_store_id='d-c3671ffba8'

# after you create a a7011e course group, change the following value:
group_id='40fc59bc-e061-7011-cf35-47fab24198cf'

course='a7011e'
user_name='foobar-2'
user_name_long="${course}-${user_name}"
first_name='Foo'
last_name='Bar'
display_name="${first_name} ${last_name}"
email='foobar-7@Student.Ltu.se'

member_id1=$(aws identitystore create-user \
      --region "$region" \
      --identity-store-id "$identity_store_id" \
      --user-name "$user_name_long" \
      --name "Formatted=string,FamilyName=$last_name,GivenName=$first_name" \
      --display-name "$display_name" \
      --emails Value="${email},Type=Ltu-${course},Primary=true" \
      --preferred-language 'en-us' \
      --locale 'SE' \
      --timezone 'Europe/Stockholm'
    )
    
# Extract the second value
member_id2=$(echo $member_id1 | awk '{print $2}')

echo member_id2: $member_id2

aws identitystore create-group-membership \
      --identity-store-id $identity_store_id \
      --group-id $group_id \
      --member-id "UserId=$member_id2"
```

Create the above script in your ~/source/bin/ directory.  Try to remember what you need to do to have the script become executable.  Try to remember how to tell bash to look for any new files in your path, including in ~/source/bin/.  Then run the above script.
</details>

<details>
<summary>Task 709 - AWS IAM Identity Center - add one user via an external script</summary>
Now create your own script and here is a suggestion, on how to modify the script to use variables.

The following is the main script you will invoke, to invoke the other script and pass parameters to it.  Make sure that you fully understand the following:

```
#!/bin/bash

# change the following, as needed, for your own envonrment.
# I have not tested this, so you may need to perform debugging on your own.

region='eu-north-1'

# replace with your identity_store_id:
identity_store_id='d-c3671ffba8'

# after you create a a7011e course group, change the following values, as needed:

group_id='40fc59bc-e061-7011-cf35-47fab24198cf'
course='a7011e'
user_name='foobar-2'
user_name_long="${course}-${user_name}"
first_name='Foo'
last_name='Bar'
display_name="${first_name} ${last_name}"
email='foobar-7@Student.Ltu.se'

iam_ic_add_user \
  $region \
  $identity_store_id \
  $group_id \
  $course \
  $user_name \
  $first_name \
  $last_name \
  $display_name \
  $email
```

Now create a new script, similar to the following. Make sure that you fully understand the following:

```
#!/bin/bash

# I have not tested this, so you may need to perform debugging on your own.

region=$1
identity_store_id=$2
group_id=$3
course=$4
user_name=$5
first_name=$6
last_name=$7
display_name=$8
email=$9

member_id1=$(aws identitystore create-user \
      --region "$region" \
      --identity-store-id "$identity_store_id" \
      --user-name "$user_name_long" \
      --name "Formatted=string,FamilyName=$last_name,GivenName=$first_name" \
      --display-name "$display_name" \
      --emails Value="${email},Type=Ltu-${course},Primary=true" \
      --preferred-language 'en-us' \
      --locale 'SE' \
      --timezone 'Europe/Stockholm'
    )
    
# Extract the second value
member_id2=$(echo $member_id1 | awk '{print $2}')

echo member_id2: $member_id2

aws identitystore create-group-membership \
      --identity-store-id $identity_store_id \
      --group-id $group_id \
      --member-id "UserId=$member_id2"
```
</details>

<details>
<summary>Task 710 - AWS IAM Identity Center - adding many users</summary>
Once your learn and understand the above tasks, it is easy to write a script to add lots of users to the IAM Identity Center.  For example, you can read user information from an SQL database and then run the script to add those users.  I've done that, even from an SQL database, when I added all of you, so I know it works fine.  However, I don't want you to spend too much time right now writing bash scripts, and reading from an SQL database, so that you have time to learn other IAM Identiy Center features and AWS Security services.
</details>

<details>
<summary>Task 711 - AWS IAM Identity Center - Permission Sets</summary>
Create an IAM Identity Center Permission Set, named "a7011e", which will later be applied to the group of a7011e students you created via the scripts, which is most likely just one user, unless you did more than is required.

In that policy, allow all s3 tasks in one policy stansa, and then in the next deny s3:GetObject.
</details>

<details>
<summary>Task 712 - AWS IAM Identity Center - Apply Permission Set</summary>
Now apply the new permission set named "a7011e" to allow the users in the IAM Identity Center group "a7011e" to be permitted to use that new permission set for the AWS account "Test".
</details>

<details>
<summary>Task 713 - AWS IAM Identity Center - Test the Applied Permission Set</summary>
Now test the new permission set named "a7011e" to allow the users in the IAM Identity Center group "a7011e" to be permitted to use that new permission set for the AWS account "Test", and see if it works.
</details>

<details>
<summary>Task 714 - AWS IAM Identity Center - Experiment with Permission Sets</summary>
Now experiment and create your own permission sets to allow the users in the IAM Identity Center group "a7011e" to be permitted to use your new permission sets for the AWS account "Test", and see if it works.
</details>

<details>
<summary>Task 715 - AWS IAM Identity Center - Experiment with Permission Sets for the "Prod" account</summary>
Now experiment and create your own permission sets to allow the users in the IAM Identity Center group "a7011e" to be permitted to use your new permission sets for the AWS account "Prod", and see if it works.
</details>
