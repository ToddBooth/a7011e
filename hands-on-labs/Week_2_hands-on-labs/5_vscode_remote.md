#### The purpose of this lab is to try vs code, while editing remote Ubuntu server files

1. If you have not yet done so, install the vs code extension by Microsoft, "Remote - SSH".
2. Click on the lower left corner, where you see a ">" and "<".
3. Then choose "Connect to Host".
4. vs code will read your ~/.ssh/config file and present you with a list of hosts.
5. Connect to your AWS Academy server.
6. Choose Open Folder, and open your /home/ubuntu folder.
7. If it is not visible, open the vs code terminal (menu > view > terminal)
8. Note that it opens a bash shell on your remote Ubuntu server.
9. In the shell, look on the far left, and it will say something like "ubuntu@"... (the user is ubuntu)
10. Create a new file on the remote Ubuntu server and edit it
11. In the shell, update your local database, with the lastest package information "sudo apt update -y".
11. In the shell, install the package "tree" with "sudo apt install -y tree".
12. In the shell, create a file with the command, "echo Hello > file.txt"
13. In the shell, enter "code file.txt" to bring up vs code on your local client, editing the remote file
12. As you go through the Cisco Linux course, try out the commands on your AWS Ubuntu server

After you get this working, submit the corresponding assignment, and just say, "completed".

See Canvas > Modules > Week 2 > 4. VS Code Remote editing

