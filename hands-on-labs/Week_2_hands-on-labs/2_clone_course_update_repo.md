#### Do a git Clone and Update

##### Last week

In week 1, some students finished lab 3, and I wanted to give those students something to do, so I created lab 4 to create a git clone, but it was not an official assignment.  Now, it's an official assignment.

If you have not done so, please do the following now, which includes some new related activities.

##### Why do I have instructions on GitHub?

For some labs, you might want to copy and paste from the assignment instructions into the bash cli or vs code.  There are some issues copying from Canvas, so I'll make some of the of the assignment text available via GitHub, in markdown.

##### Authenticate to GitHub

You need to first authenticate to GitHub, in order to have access to my private course repository named ToddBooth/a7011e.

Based on the previous GitHub ssh session, you should be able to now authenticate with the following command:

```
ssh github.com
```

It will say, "sucessfully authenticated, but GitHub does not provide shell access".  This is normal.  After authenticating to GitHub, you can use git commands without authenticating again.

##### Accept the GitHub collaborator invitations

You were asked to do the following by the end of Monday, October 30th:  Please create a GitHub account and take note of your GitHub username.  Fill out the following form, and enter your GitHub username.

See Canvas > Collaborations > Student Information

On Thursday, Nov. 2nd, at about 6:40PM, I did the folllowing for students who had filled out the above form by that time:

1. Created a private repository named ToddBooth/z- (followed by the student name)
2. Added the student to be a collaborator in the above respository.
3. 


.  They are named "z-" following by your student-id.  I also added those students to be collaborators in my private repository named "a7011e".




##### Start a bash shell

On Windows it's called the GitBash app (after you install Git for Windows).  Start your bash shell.  After you start your shell, you will see a prompt, as something like the following:

```
B2958+todboo-local@B2958 MINGW64 ~
```

Note that, at the end of the above line, there is a "~", not followed by anything.  That means that you are in your home directory.

If you were in a different directory, (not your home directory) for example, ~/.ssh, you would see something like the following:

```
B2958+todboo-local@B2958 MINGW64 ~/.ssh
```


Only if you are not in your home directory, change to your home directory, with "cd" enter.

```
cd
```


Make the directory "source" and within that make the directory "repos", with "mkdir -p source/repos"

mkdir -p source/repos

Change to the course/repos directory with "cd source/repos"

cd source/repos

You should have received an invitation to be a collaborator in two of Teacher Todd's GitHub repos.  You need to accept both invitations.  If you did not receive an invitation, it might be due to you not having created your GitHub account OR you didn't update Todd's Canvas > Collaboration > Student Information spreadsheet with your GitHub account information.  So, do that and try again in a day or two.

To download from a private GitHub repository, you need to authenticate to GitHub first.  I will teach you how to authenticate via ssh next week.  After that, next week you will do the following.

After you accept the two invitations, do the following:

ssh github.com

git clone git@github.com:ToddBooth/a7011e

List the directory, with "ls -l"

ls -l

More instructions will be coming soon, this lab is not yet ready.

Now, please update your local course repository.  You can download any and all changes that I made to the GitHub repository.

Note!  If you made any local changes, you may lose those changes (if you give git that option to do so).  So, if you want to make any changes to the course repository files, you should copy those files to another place, and make the changes there.  

Each week, or maybe more often, I will make changes to the course repository.

To download the latest changes, do the following, from the bash cli:

```
cd ~/source/repos/a7011n
git pull
```

