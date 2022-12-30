#!/bin/bash

# This script will pull an image from an Amazon ECR repository and deploy it using Travis-ci
#!/bin/bash

# Install the AWS CLI and authenticate with AWS ECR
pip install awscli
$(aws ecr get-login --no-include-email --region us-east-1)

# Pull the latest image from the AWS ECR repository
docker pull m647269089792.dkr.ecr.us-east-1.amazonaws.com/my-image:latest

# Build a new Docker image based on the current codebase
docker build -t imagetest .

# Tag the new image with the same tag as the latest image in the AWS ECR repository
docker tag imagetest 647269089792.dkr.ecr.us-east-1.amazonaws.com/my-image:latest

# Push the new image to the AWS ECR repository
docker push 647269089792.dkr.ecr.us-east-1.amazonaws.com/my-image:latest
