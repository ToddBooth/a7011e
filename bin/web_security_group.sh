#!/bin/bash

# set the value of the VPC tag "Name"
VPC="$1"

# get the value of the VpcID, based on the tag name


# Create the security group
aws ec2 create-security-group \
  --group-name Web \
  --description "Web Security Group" \
  --vpc-id <Your-VPC-ID>

# Authorize inbound traffic on TCP ports 80 and 443
aws ec2 authorize-security-group-ingress \
  --group-name Web \
  --protocol tcp \
  --port 80 \
  --cidr 0.0.0.0/0

aws ec2 authorize-security-group-ingress \
  --group-name Web \
  --protocol tcp \
  --port 443 \
  --cidr 0.0.0.0/0

# Deny all inbound traffic by default
aws ec2 revoke-security-group-ingress \
  --group-name Web \
  --protocol "-1" \
  --source 0.0.0.0/0

# Tag the security group
aws ec2 create-tags \
  --resources <Security-Group-ID> \
  --tags Key=Name,Value=Web
