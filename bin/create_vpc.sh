#!/bin/bash

# This script will create a VPC (Development, Testing, and Production), based on the argument received.

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

# Create the VPC
tag=$1
cidr=$2

# Create the VPC
create_vpc "${tag}" ${cidr}
