#!/bin/bash

# This script will pull an image from an Amazon ECR repository and deploy it using Travis-ci

# Set the AWS credentials
export AWS_ACCESS_KEY_ID="your-access-key-id"
export AWS_SECRET_ACCESS_KEY="your-secret-access-key"

# Get the AWS ECR login command
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin https://aws_account_id.dkr.ecr.us-east-1.amazonaws.com

# Pull the image
docker pull aws_account_id.dkr.ecr.us-east-1.amazonaws.com/your-image-name:latest

# Deploy the image using Travis-ci-
travis deploy --com AWS_ECR --image aws_account_id.dkr.ecr.us-east-1.amazonaws.com/your-image-name:latest