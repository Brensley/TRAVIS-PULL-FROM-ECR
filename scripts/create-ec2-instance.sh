#!/bin/bash

# This will now create an EC2 instance using the AMI and instance type specified in the environment variables.
instance_id=$(aws ec2 run-instances --image-id ami-0a606d8395a538502 --count 1 --instance-type t2.micro --key-name bfos-keypair --security-group-ids sg-b7b1e6de --subnet-id subnet-da2ad497 --associate-public)
