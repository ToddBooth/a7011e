#!/bin/bash

# This script will delete three VPC's (Development, Testing, and Production)

# Create a function to delete a given VPC
delete_vpc()
{
    # Define the tag key-value pair
    TAG_KEY="Name"
    TAG_VALUE="$1"

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
}

# Delete the VPC's

# Delete the Development VPC
delete_vpc 'Development'

# Delete the Testing VPC
delete_vpc 'Testing'

# Delete the Production VPC
delete_vpc 'Production'

# Now, get a list of all of the VPCs, to verify that the three VPC's no longer exists.
aws ec2 describe-vpcs | grep -E 'VpcId|IsDefault|0.0/16|Value'
