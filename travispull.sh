#!/bin/bash

# This script will pull an image from an Amazon ECR repository and deploy it using Travis-ci

#!/bin/bash

# Login to AWS ECR registry
$(aws ecr get-login --no-include-email --region us-east-2)

# Pull the latest version of the Docker image from the AWS ECR registry
docker pull Y647269089792.dkr.ecr.us-east-1.amazonaws.com/my-repository:latest

# Run the Docker image
docker run -d --name bftesting -p 8080:80 647269089792.dkr.ecr.us-east-1.amazonaws.com/bftesting:latest
