#### The goal is to create an AWS Ubuntu instance, via the AWS Management Console

##### Create the AWS Ubuntu instance

1. Login to your AWS Academy account
2. Choose the Learner Lab
3. Choose Canvas > Modules >  AWS Academy Learner Lab > Launch AWS Academy Learner Lab
4. Click on "Start lab"
5. Note that the lab will run for only four hours, then it will stop and your Ubuntu instance will stop.  To override this issue, you can click "Start lab" again after three and a half hours and it will run for another four hours.
6. Wait for the "AWS" button, on the top left, to turn green
6. Click on the upper right, "AWS Details"
7. Click on the "SSH key" -> "Download PEM" button.  It will download a file named "labsuser.pem" to your Downloads folder.
8. Via the bash shell, move the file to ~/source/secrets/ssh/. Command might be something like the following:
8. mv ~/Downloads/labsuser.pem ~/source/secrets/ssh/.
7. When the "AWS" button on the top left turns green, click on it to get a browswer tab in the AWS Management Console
7. Choose the "EC2" service
8. Click on the left, "Instances".
9. Click in the upper right, "Launch Instances".
10. Give it the name AWS-Academy-01
11. Click on Ubuntu
12. Change the "Instance type" from the default to "t3.micro"
13. Select the keypair name, "vockey"
14. For the Firewall (security groups), choose "Select existing security group", and select the "Default"
15. Change the "Configure storage" to "15"
16. Open the "Advanced details"
17. Change the "IAM instance profile" to "LabInstanceProfile"
18. In the lower right, choose "Launch instance"
19. Click on the instance number (i-xxx), which is a link
20. Scroll down and click on the security tab
21. Click on the "security group" link
22. Change the inbound rules to allow SSH (port 22), from anywhere (soucre = 0.0.0.0/0).  Give a description of "SSH from anywhere".  Save the rules

##### Create the Elastic IP Address

Every time you stop and start your Ubuntu instance, by default, you will be given a new IP address, which means you would have to keep changing the ~/.ssh/config file with the new IP address.  To avoid this problem, you can create a static public IP address, as follows:

1. Search for the service, "EC2"
2. On the left, look for "Network and Security"
3. Under that, click on "Elastic IPs"
4. Click on the upper right, "Allocate Elastic IP Address"
5. Click on the lower right, "Allocate"
6. Click on the upper right, "Actions" -> "Associate Elastic IP address"
7. Click on the instance box, and choose your "AWS Academy" server
8. Click on the lower right, "Associate"

After you get this working, submit the corresponding assignment, and just say, "completed".

See Canvas > Modules > Week 2 > 2. Create AWS Instance
