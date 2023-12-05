<details>
<summary>Task 601 - Introduction</summary>
This course is all about IT Infrastructure Security, and again IT Infrastructure includes:

1. Compute
2. Storage
3. Networking, and
4. Security

We could also think as IT Infrastructure as the first three, and we need to implement IT Infrastructure security for all three.  

1. Compute (and related security)
2. Storage (and related security)
3. Networking (and related security)
4. Security (there will always some other security controls that don't fit into the above)

If there are any mistakes in these hands-on labs, try on your own to debug the problem, then send me the problem and solution, thanks!

Good Luck!  Teacher Todd
</details>

<details>
<summary>Task 602 - How to login to AWS</summary>
You will need to be able to login to multiple AWS accounts simultaneously.  If you have just one web browser window open with multiple AWS login tabs open, they will conflict and cause problems for AWS.  You will receive a message that you have to login again in the conflicting browser tabs.  So, it is recommended that you do the following instead, for for hands-on labs.

When you want to have your Web browser open tabs for multiple AWS logins, instead you should open completly separate Web browser windows, for example with Chrome incognito or Firefox private window options.  Or in Chrome, you can different users, and then then the different windows (one for each user) will not conflict.  This lets you switch back and forth between you two AWS accounts, very quickly.

We're going to first have some hands-on labs, where you will create a new account, and you will need the following windows open, in one or another hands-on lab:

1. AWS Management account, logged in as root
2. AWS Management account, logged in as administrator
3. AWS Management account, logged in as a normal user, with your student-id (later)

After many hours I've realized that it is impossible for you to learn the AWS Organizations service or the AWS IAM Identity service without getting some hands-on experience.  Even when I created my AWS Oganization and created my AWS Identity service, I can't give you permissions for either AWS Organizations or AWS Identity service, without giving you too permisive access.

So, students will create their own AWS accounts, to be used for AWS Organizations and AWS IAM Identity Center.  However, first you will learn something which is much easier to learn, which is account based IAM inline policies (with just users, groups, roles, and inline policies).
</details>

<details>
<summary>Task 603 - Create an AWS Account</summary>
To do many of the hands-on labs, you'll need one or more brand new AWS accounts to work with.

It is recommended that all students create their own AWS account, which will be used to perform hands-on labs, for the AWS IAM, AWS Organizations, and AWS IAM Identity Center hands-on labs.  If you create an AWS account, and this is the first AWS account you create, you will get the "free tier" service, and get many free services for 12 months, which is great since your AWS Academy accounts will close soon after the course is over, in January.

To create an AWS account, you will need a credit card, for verification, and to pay for any services that you use, that cost money.  Many AWS services are free for the first 12 months, but it can be tricky.  For example, they give you one free Linux server, but you can only have it configured with 1GB, not 2GB.  So, if you start a Linux server with 2GB, they will charge your credit card.  So, I suggest that you only use the AWS accounts you create for testing AWS Organizations, IAM, and IAM Identity Center policies, since they are all free.  All of the hands-on labs I ask you to do with your own account are free.  If you have one, use a virtual credit card, where you can set the limit very low, like 10kr, in case someone abuses your AWS account, or you make a mistake.

If you don't want to create an AWS account, that is not problem, you just need to join a study buddy group, where at least one student creates an account and agrees to do hands-on labs with you, possibly via zoom.  Since some students may not want to create an account, I will now allow five students per study buddy group, so that if you don't want to create an account, you can more easily find a group who created an account.  

Please update Canvas > Collaboratiion > Student Information, with a decision if you will create an AWS Account, and change your student buddy groups, as required, so, that you are in a group with a student who will have an AWS account.  On Tuesday, December 5th, you can use the Canvas chat to find a student to join, who has an AWS account that they signed up for.

For services that cost AWS money/credits, like EC2, you should continue to use your free 100 USD in credits, on the AWS Academy server.

If you use an eamil account that supports plus addresses, such as with gmail.com, you should use a plus addresses for your AWS accounts.  So, if you have an gmail address "me@gmail.com", you can use the address "me+Aws-Management@gmail.com", for the new account.  With this name, when you receive emails from AWS, from looking at the sent to email address, you'll know which AWS account it is concerning.

To create first account that you will create, surf to: [AWS](https://Aws.com), and click "Create account" in the upper right.  Then follow the instructions.  For the account name, choose "Management".
</details>

<details>
<summary>Task 604 - Setup MFA for the root user</summary>
If there was a virus on your computer and they could access your new AWS Management root user account credentials, they would be able to spin up lots of EC2 instances and run bitcoin minings applications, which might cost you a lot of money.  So, to prevent this, for you, and for the company you work for in the future, you will now learn to setup MFA on the AWS Management root user.

1. Login to your new AWS Management account.  
2. Search for and run the IAM service
3. In the middle, you should see, "Security recommendations" ... "Add MFA for root user", click on that.
4. Follow the instructions to set up MFA
5. You can use the Google Authenticator or Microsoft Authenticator apps.
6. Log out
7. Log in and verify that it required you to use MFA to login.

Note that you will create some more AWS account, but DON'T CREATE THEM YET!  Wait until after you create an AWS Organization, because you need to create them in a certain way, documented later.
</details>

<details>
<summary>Task 605 - Setup a Budget Alert Email</summary>
It is very important to keep track of the AWS charges, both as a student, and at your future company.  Please setup a Budget Alert Email as follows:

1. Login to your new AWS Management account.  
2. Search for and run the "Billing and Cost Management" service
3. Click on the left, "Cost Explorer".
4. You should get a message that it will take up to 24 hours to prepare the data.
5. Log back in after 24 hours and click on the left, near the bottom "Budgets".
6. Choose "Use a template"
7. I suggest to choose "Zero spend budget", so that you are alerted if there any any charges at all that you have to pay for.
8. Enter the email address that you want the alert sent to.
9. Click on the lower right, "Create budget".
</details>

<details>
<summary>Task 606 - Security the IT Infrastructure: Security of AWS S3 object storage</summary>
Storage is one big part of IT Infrastructure.  One popular type of public cloud storage is AWS S3 object storage, so need now have a hands-on lab to secure S3.  

Amazon Simple Storage Service (Amazon S3) is a highly scalable and durable object storage service provided by Amazon Web Services (AWS). It is designed to store and retrieve any amount of data from anywhere on the web. Amazon S3 is widely used for various purposes, including data storage, backup and restore, archiving, content distribution, and serving static websites.

Key features of Amazon S3 include:

Object Storage:

1. S3 stores data as objects, which consist of data, a key (unique within a bucket), and metadata.
Durability and Availability:

2. S3 is designed for 99.999999999% (11 nines) durability of objects across multiple Availability Zones within a region.
Scalability:

3. S3 automatically scales to handle a virtually unlimited amount of data. You can store an unlimited number of objects, each ranging from 0 bytes to 5 terabytes.

Multiple Storage Classes:

1. S3 provides different storage classes to optimize costs based on the access patterns and durability requirements of your data, including Standard, Intelligent-Tiering, Standard-IA (Infrequent Access), Glacier (for archival), and more.

Versioning:

1. Versioning allows you to keep multiple versions of an object in a bucket. This feature helps with data recovery and protection against accidental deletion.
Security and Access Control:

2. S3 allows you to control access to your data using bucket policies, Access Control Lists (ACLs), and AWS Identity and Access Management (IAM) roles.

Data Transfer Acceleration:

1. S3 Transfer Acceleration uses the CloudFront global network to accelerate uploads to and downloads from your S3 bucket.

Event Notifications:

1. You can configure event notifications to trigger AWS Lambda functions, SQS queues, or SNS topics when objects are created or deleted.

Logging and Auditing:

1. S3 provides logging features that allow you to track and analyze access to your bucket. You can also enable server access logging.
Static Website Hosting:

WebSite Hosting:

1. S3 can be used to host static websites by configuring the bucket for website hosting.

Amazon S3 is a versatile and widely used service that forms a fundamental part of many AWS architectures. It is often used in conjunction with other AWS services for building scalable and resilient applications.

The following policy allows all S3 actions, except S3 GetObject.  If you wanted to, you could add more S3 actions to the deny list, and they would also be denied.  For example, you could add the following actions to the S3 deny list:

1. s3:DeleteBucket:
Denying the ability to delete an S3 bucket can help prevent accidental or intentional deletion of critical data.

2. s3:DeleteObject:
Denying the ability to delete objects within a bucket can protect against unauthorized removal of important files.

3. s3:PutBucketPolicy:
Denying the ability to modify the bucket policy can help prevent unauthorized changes to access control configurations.

4. s3:PutBucketAcl:
Denying the ability to modify the bucket ACL (Access Control List) can help maintain control over who has access to the bucket.

5. s3:PutObjectAcl:
Denying the ability to modify object ACLs can help control access to individual objects within a bucket.

6. s3:PutObjectVersionAcl:
Similar to PutObjectAcl, denying the ability to modify versioned object ACLs helps control access in versioned buckets.

7. s3:PutBucketLogging:
Denying the ability to enable or modify bucket logging can help maintain the integrity of access logs.

8. s3:PutBucketEncryption:
Denying the ability to modify bucket encryption settings helps ensure the security of stored data.

9. s3:PutBucketPublicAccessBlock:
Denying the ability to modify public access settings for a bucket can help prevent unintentional exposure of data.

10. s3:DeleteBucketPolicy:
Denying the ability to delete the bucket policy can prevent unauthorized removal of the access policy.

11. s3:DeleteBucketWebsite:
Denying the ability to delete the bucket website configuration can help preserve web hosting settings.

12. s3:DeleteBucketCors:
Denying the ability to delete the CORS (Cross-Origin Resource Sharing) configuration helps control cross-origin access.

Here are the instructions:

1. Login to your new AWS Management account.  
2. Search for and run the IAM service
3. Click on the left, "Policies".
4. Click on the upper right, "Create policy".
5. Click on the upper right, "JSON".
6. Paste the following to replace the old json, and take the time to understand it.
```
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "AllowSeveral",
			"Effect": "Allow",
			"Action": [
				"cloudtrail:*",
				"cloudwatch:*",
			  "s3:*",
				"iam:*",
        "q:*"
			],
			"Resource": "*"
		},
		{
			"Sid": "DenyS3GetObject",
			"Effect": "Deny",
			"Action": "s3:GetObject",
			"Resource": "*"
		},
		{
			"Sid": "AllowAccessAnalyzer",
			"Effect": "Allow",
			"Action": "access-analyzer:ListPolicyGenerations",
			"Resource": "*"
		}
	]
}
```
7. Now add specific denies for two or more of s3:actions listed in the previous task, to the above policy.
8. Scroll down and click on the lower right, "Next"
9. Name the policy, "Administrators"
10. Note that it lists your policies below
11. Click on the lower right, "Create policy"
</details>

<details>
<summary>Task 607 - Create a user named Administrator</summary>
1. Login to your new AWS Management account.  
2. Search for and run the IAM service
3. Click on the left, "Users".
4. Click on the right, "Create user"
5. Enter, "Administrator"
6. Click on "Provide access to the AWS Management Console"
7. Select "I want to create an IAM user" (you will learn IAM Identity Center later)
8. Choose a password option, but document the password.
9. If you want, disable "Users must create a new password at next sign-in"
10. Click on the lower right "Next"
11. Click on the right "Attach policies diretly"
12. Click on "Filter by Type" and choose "Customer managed".
13. Select the "Administors" policy that you created earlier.
14. Click on the lower right, "Create user".
15. Save the url from the "Console sign-in URL" field, for login later.
</details>

<details>
<summary>Task 608 - Test the Administrator Policy</summary>
We will now test the Administrator policy.

1. Start a brand new Web browser window.
2. Login to your new AWS Management account (as Administrator, with the previous url and previous password)
3. Find the service "S3"
4. Create an S3 bucket (verify it works)
5. Find the service "EC2"
6. Try to create an EC2 instance (verify it fails)
7. Jump back to the other windows, the logged in as "root" window
8. Find the service "IAM".
9. Click on the left, "Policies".
10. Click on "Filter by Type", and select "Customer managed".
11. Click on your own "Administrators" policy.
12. Click on the right, "Edit".
13. Delete the line, "s3:*".
14. In the lower right click, "Next".
15. In the lower right click, "Save changes".
16. Verify that "S3" no longer shows up under "Permissions defined".
17. Jump back to the other window (user Administrator)
18. Try to create another S3 bucket (and verify it fails)
19. Jump back to the other window (user root)
20. On your own, figure out how to add back to the policy, the line that read "s3:*", and save it.
21. Jump back to the Administrator and verify that you can create a new S3 bucket.
22. Then delete all your S3 buckets.
</details>

<details>
<summary>Task 609 - Security the IT Infrastructure: Security of AWS block storage (EBS)</summary>
Storage is one big part of IT Infrastructure.  You learned how to implement some IT Infrastructure Seucurity on AWS s3 object storage.  Another type of storage is AWS EBS (Elastic Block Storage).  In this hands-on lab, you will how to secure EBS.

Amazon Elastic Block Store (Amazon EBS) is a service that provides block-level storage volumes for use with Amazon EC2 instances. Here are ten popular AWS Identity and Access Management (IAM) actions related to Amazon EBS that you might want to control or allow in your IAM policies:

1. ec2:AttachVolume:
Allows attaching an Amazon EBS volume to an Amazon EC2 instance.

2. ec2:CreateSnapshot:
Permits creating a snapshot of an Amazon EBS volume. Snapshots are point-in-time copies of volumes and are often used for backup purposes.

3. ec2:CreateVolume:
Enables the creation of new Amazon EBS volumes. This action is used to provision additional storage.

4. ec2:DeleteSnapshot:
Allows deleting an Amazon EBS snapshot.

5. ec2:DeleteVolume:
Permits the deletion of an Amazon EBS volume.

6. ec2:DescribeSnapshots:
Allows listing and describing Amazon EBS snapshots.

7. ec2:DescribeVolumes:
Allows listing and describing Amazon EBS volumes.

8. ec2:DetachVolume:
Permits detaching an Amazon EBS volume from an Amazon EC2 instance.

9. ec2:ModifyVolume:
Enables modifying the attributes of an Amazon EBS volume, such as the volume type or size.

10. ec2:CreateTags and ec2:DeleteTags:
Allows the creation and deletion of tags on Amazon EBS resources. Tags are useful for organizing and categorizing resources.

When crafting IAM policies, it's crucial to consider the specific actions required for your use case and apply the principle of least privilege. This means granting users or roles the minimum set of permissions necessary to perform their tasks effectively, without providing unnecessary access.

The following policy allows all EBS actions, except EBS xx.  If you wanted to, you could add more EBS actions to the deny list, and they would also be denied.  For example, you could some of the above actions to the EBS deny list:

Here are the instructions:

1. Login to your new AWS Management account, as the root user.  
2. Search for and run the IAM service
3. Click on the left, "Policies".
4. Click on the top, "Filter by Type".
5. Click on the upper right, "JSON".
6. Select "Customer managed".
7. Select the policy you created earlier, called "Admininstrators".
8. Paste the following to replace the old json, and take the time to understand it.
9. Save the above policy to apply it.
```
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "AllowSeveral",
			"Effect": "Allow",
			"Action": [
				"cloudtrail:*",
				"cloudwatch:*",
        "ebs:*",
			  "s3:*",
				"iam:*",
        "q:*"
			],
			"Resource": "*"
		},
		{
			"Sid": "DenyEbsDeny",
			"Effect": "Deny",
			"Action": "ebs:CreateTags",
			"Resource": "*"
		},
		{
			"Sid": "DenyS3GetObject",
			"Effect": "Deny",
			"Action": "s3:GetObject",
			"Resource": "*"
		},
		{
			"Sid": "AllowAccessAnalyzer",
			"Effect": "Allow",
			"Action": "access-analyzer:ListPolicyGenerations",
			"Resource": "*"
		}
	]
}
```
</details>

<details>
<summary>Task 610 - NoSQL Database - AWS DynamoDB</summary>
DynamoDB is a managed NoSQL database service. The Free Tier includes a certain amount of read and write capacity units, storage, and data transfer.  We'll create and then delete a NoSQL DynamoDB database.

1. Login to your new AWS Management account (as Administrator, with the previous url and previous password).  The following will not work (unless you do step 2.), but if you want to verify that it does not work, you can try that (optional)
2. In the Web window with your "root" login, do the following: On your own, enable the DynamoDB service, to be allowed by Administrator, by editing the IAM policy "Administrators", and adding a line that says, "dynamodb:*",
3. Jump to the AWS Administrator window.
4. Find the service "DynamoDB"
5. Click on the right, "Create a table"
6. For the table name, enter "Test_Table_1"
7. For the Partition key, enter "Pid"
8. For the Sort key, enter "Sid"
9. Change to "Customize settings" (and learn what it means)
10. Change to "DynamoDB Standard-IA" (and learn what it means)
11. Change to "On demand" (and learn what it means)
12. Leave the rest of the defaults and click on the bottom right, "Create table".
13. If you did step 2. correctly, you should have created a DynamoDB table
14. Now, immediately delete the table.
15. It is very important that you delete the table, and if you need help contact me.
16. Then change the policy back, by removing "dynamodb:*", from the policy.
17. Then verify that you can no longer create a DynamoDB table.
</details>

<details>
<summary>Task 611 - Add an IAM Group</summary>
You have now learned how to create an AWS account, secure root access via an MFA, create a budget, create a policy, create a user Administrator, apply the policy to Administrator, and make changes to user Administratrator's policy.  This was not the best practice, but to me, it is obvious that after you learned these basic skills, it will be much easier to learn the best practice skills.  I wish I could just point you to other material, but I could not find any other great material to teach you in an easy to learn way.  So, now you will learn about AWS IAM Groups, and the best practice on how to use AWS IAM Groups.  

You need to fully understand the following.  There are two ways to create the IAM group Administrators and give that group permissions.

1. You can login as root, and and the root user can take the actions.
2. Or root can give the user Administrator or group Administrors the AWS IAM rights to perform the action, via adding "iam:*" to the list of allowed permissions.
3. Then the Administrator can login and perform the actions.
4. For this hands-on labs, try to give the Administor user the "iam:*" rights, and login as Administrator
5. On your own, try to figure out how to create the group named "Administrators".
6. Then add the user, "Administrator", to the new group named "Administratorys".
7. Add the policy named, "Administrators" to the new group named, "Administrators".
8. Remove the policy named, "Administrators" frmo the past user named, "Administrators".
</details>

<details>
<summary>Task 612 - Create an AWS Organization</summary>
In the previous task, you created a new AWS account.  In this task you will create a new AWS Oganization, based on the previous account you created, which will become the AWS organization "Security" account.

When you login to your new AWS account, you should use a new web browser window, so that it does not conflict with your previous  windows.  After you log in to AWS with your Management account, do an AWS search for the "organizations" service, and choose that.

Then do the following to enable AWS organizations:

1. Open the AWS Organizations console.
2. In Create organization page, Choose Create organization.
3. AWS will create an organization, with a root OU (organization unit), and the Management account will be a member of the root OU.  This may take a minute or so. 
</details>

<details>
<summary>Task 613 - Add an account to AWS Organization</summary>
AWS Organizations has no value, unless there are multiple account in the AWS Organization, so you will create the following AWS accounts, which will all be a part of the AWS Organization:

1. Management account (where you create and control the AWS Organizations)
2. Security account (for security work, such as auditing)
3. Dev (Development) account, for use in developing the services
4. Test account, to test the services
5. Prod (Production) account, to run the actual services

In this task, you will create a 2nd AWS Account and add it to your AWS Organization, named "Security"

If you create the 2nd AWS account, from within your main AWS Account, from within the AWS Organizations service, you don't need to provide a credit card again, so I'll show you how to do that now.  Note that any charges from your "Security" account, will be rolled up into the Management account billing information.

From your main management account, surf to "AWS Organizations".

1. Click on "AWS accounts".
2. Click on the upper right, "Add an AWS account"
3. Select, "Create an AWS account".
4. In the "AWS account name" box, enter, "Security".
5. Then there is a box which states, "Email address of the account's owner"
6. Note that in AWS, you need a separate and disinct email address for every AWS account.
7. If possible, I suggest to use a plus address.  So, if you have an gmail address "me@gmail.com", you can use the address "me+Aws-Security@gmail.com", for the new account.  With this name, when you receive emails from AWS, from looking at the sent to email address, you'll know which AWS account it is concerning.
8. Note that they have a bug.  In the Management account it might say, "AWS is creating 1 account", but after you get the email refresh that page, and you'll then see the new "Security" account in your organization. 
</details>

<details>
<summary>Task 614 - Add another account to AWS Organization, for "Dev"</summary>
Follow the instructions, as in the previous task, but create this new "Dev" account.
</details>

<details>
<summary>Task 615 - Add another account to AWS Organization, for "Test"</summary>
Follow the instructions, as in the previous task, but create this new "Test" account.
</details>

<details>
<summary>Task 616 - Add another account to AWS Organization, for "Prod"</summary>
Follow the instructions, as in the previous task, but create this new "Prod" account.
</details>

