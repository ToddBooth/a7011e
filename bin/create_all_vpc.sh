#!/bin/bash

# This script will create three VPC's (Development, Testing, and Production)

# Create a function to create a given VPC
create_vpc()
{
    # Define the tag key-value pair
    TAG_KEY="Name"
    TAG_VALUE="$1"
    CIDR="$2"

    # Create the VPC and capture the VPC ID
    VPC_ID=$(aws ec2 create-vpc --cidr-block ${CIDR}/16 --query 'Vpc.VpcId' --output text)
    
    # Tag the VPC with a name
    aws ec2 create-tags --resources $VPC_ID --tags Key=Name,Value=${TAG_VALUE}
}

# Create the VPC's

# Create the Development VPC
create_vpc 'Development' 10.1.0.0

# Create the Testing VPC
create_vpc 'Testing' 10.2.0.0

# Create the Production VPC
create_vpc 'Production' 10.3.0.0

# Now, get a list of all of the VPCs, to verify that the VPC's were created.
aws ec2 describe-vpcs | grep -E 'VpcId|IsDefault|0.0/16|Value'
