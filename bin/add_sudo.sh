#!/bin/bash

# Replace <username> with the actual username
USERNAME='teacher_todd'

# Add the user to the sudo group
usermod -aG sudo $USERNAME

# Edit the sudoers file to grant passwordless sudo access
echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers.d/$USERNAME
