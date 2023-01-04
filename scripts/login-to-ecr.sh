#!/bin/bash

# Locate the account ID and region for the ECR repository.
account_id=$(aws sts get-caller-identity --output text --query 'Account')
region=$(aws configure get region)

# Now get the login command for the ECR repository.
login_command=$(aws ecr get-login --region us-east-2)

# Execute the login command.
eval $login_command