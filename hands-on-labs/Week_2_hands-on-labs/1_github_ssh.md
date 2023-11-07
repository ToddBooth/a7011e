#### The Goal of this hands-on lab, is to authenticate to GitHub via ssh

##### create an rsa keypair (from the bash shell)

```
# create the directory structure, if needed
mkdir -p ~/source/secrets/ssh
cd ~/source/secrets/ssh

# 4096 bits has very strong security
# -N avoids the passphrase prompt
ssh-keygen -t rsa -b 4096 -C "Your_Comment_Here" -f keypair_1001_rsa -N ""

# list the two keypair files
ls -l keypair_1001_rsa*
```

##### copy the public key contents (keypair_1001_rsa.pub) to GitHub

Output the contents of the file to stdout
```
cat keypair_1001_rsa.pub
```

GitHub - upper right, click on account -> settings, then on the left, click on "SSH and GPG keys"

Click on the upper right, "New SSH key".  Provide a title, and paste the public key information into the box

Click on the middle bottom, "Add SSH key"

Copy and paste the following to your file ~/.ssh/config. Make changes to the file as appropriate

code ~/.ssh/config

```
# This is so that you can authenticate to GitHub
Host github.com
    HostName GitHub.Com
    User git 
    StrictHostKeyChecking no
    IdentityFile ~/source/secrets/ssh/keypair_1001_rsa
```

##### Then test it with:
```
ssh github.com
```

It will say, "sucessfully authenticated, but GitHub does not provide shell access".  This is normal.

After authenticating to GitHub, you can use git commands without authenticating again.

If ssh github.com fails, then you should try to debug the problem with ssh verbose mode, as follows:

```
ssh -v github.com
```

After you get this working, submit the corresponding assignment, and just say, "completed".

See Canvas > Modules > Week 2 > 1. GitHub SSH
