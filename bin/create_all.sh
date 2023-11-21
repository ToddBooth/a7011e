#!/bin/bash

create_all()
{
    type=$1
    cidr=$2
    create_vpc $type $cidr

    # The following are temporarily commented out
    # create_firewall  $type $cidr
    # create_web_servers  $type $cidr
    # create_subnets  $type $cidr
    # create_route_tables  $type $cidr
    # create_internet_gateways  $type $cidr
    # create_iam_roles  $type $cidr
    # create_elastic_load_balancers  $type $cidr
    # create_auto_scaling_groups  $type $cidr
    # create_cloudwatch_monitoring  $type $cidr
    # etc...
}

create_all 'Developer'  '10.1.0.0'
create_all 'Testing'    '10.2.0.0'
create_all 'Production' '10.3.0.0'
