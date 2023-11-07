#### The Goal of this hands-on lab, is to ssh to your AWS Ubuntu instance via ssh

The following is the ssh configuration, for your AWS Ubuntu instance.  Change the HostName to your instance's public IP address.  Use an Elastic IP address so that the IP address does not change.  Copy and paste the following to your ~/.ssh/config file.

```
Host aws-academy
	HostName 54.205.197.xx
	User ubuntu
    Port 22
    StrictHostKeyChecking no
    IdentityFile ~/source/secrets/ssh/labsuser.pem
```

Verify that the file labsuser.pem exists, in the right location.

```
ls -l ~/source/secrets/ssh/labsuser.pem
```

Tighten the security, by changing the permissons to 600
```
chmod 600 ~/source/secrets/ssh/labsuser.pem
```

Test if the ssh service is listening on the server. To run nping, you need to install [nmap](https://nmap.org).

```
nping --tcp-connect -p 22 -c 1 -H your_server_public_ip_address
```

If the server is not listening on port 22, check to make sure that the server is running.

Login to your AWS Ubuntu server with "ssh aws-academy".  When you are done with your session, you can type, "exit", to return to your local shell.  You're learn more about Linux in this course, and then we'll have you do some interesting things with your Linux/Ubuntu server.

If you have problems with the ssh connection, use the "-v" switch, to get more debugging information.

```
ssh -v aws-academy
```

After you get this working, submit the corresponding assignment, and just say, "completed".

See Canvas > Modules > Week 2 > 3. SSH to AWS Instance
