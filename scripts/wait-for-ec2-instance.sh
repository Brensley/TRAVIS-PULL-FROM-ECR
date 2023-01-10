#!/bin/bash

# Wait for the EC2 instance to be in a "running" state..
aws ec2 wait instance-running --instance-ids ec2-image

# Get the public IP address of the EC2 instance.
public_ip=$(aws ec2 describe-instances --instance-ids ec2-image --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)

# Update the `~/.ssh/config` file to use the correct IP address for SSH.
echo -e "Host my-ec2-instance\n  HostName $public_ip\n  User ec2-user\n  IdentityFile ~/.ssh/my-key-pair.pem" >> ~/.ssh/config