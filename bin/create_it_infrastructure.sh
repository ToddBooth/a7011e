#!/bin/bash

type='Developer'
# type='Testing'
# type='Production'

create_vpc.sh $type
# create_firewall.sh $type
# create_web_servers $type
# create_subnets.sh $type
# create_route_tables.sh $type
# create_internet_gateways $type
# create_iam_roles $type
# create_elastic_load_balancers $type
# create_auto_scaling_groups $type
# create_cloudwatch_monitoring.sh $type
# etc...
