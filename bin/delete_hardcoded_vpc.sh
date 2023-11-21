#!/bin/bash

# This script will delete the Development VPC

# Define the tag key-value pair
# TAG_KEY="Value"
TAG_KEY="Name"
TAG_VALUE="Development"

# Use the AWS CLI to describe VPCs with the specified tag
# echo VPC_DESCRIPTION=$(aws ec2 describe-vpcs --filters "Name=tag:${TAG_KEY},Values=${TAG_VALUE}")
# echo aws ec2 describe-vpcs --filters "Name=tag:${TAG_KEY},Values=${TAG_VALUE}"

VPC_DESCRIPTION=$(aws ec2 describe-vpcs --filters "Name=tag:${TAG_KEY},Values=${TAG_VALUE}")

# Extract the VPC ID from the output
VPC_ID=$(echo "${VPC_DESCRIPTION}" | jq -r '.Vpcs[0].VpcId')

# Display the VPC ID
echo "VPC ID with tag ${TAG_KEY}:${TAG_VALUE} is: ${VPC_ID}"

# Delete the VPC
aws ec2 delete-vpc --vpc-id $VPC_ID

# Now, get a list of all of the VPCs, to verify that the Production VPC no longer exists.
aws ec2 describe-vpcs | grep -E 'VpcId|IsDefault|0.0/16|Value'
