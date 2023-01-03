# This script will pull an image from an Amazon ECR repository and deploy it using Travis-ci

#!/bin/bash

# Login to AWS ECR
$(aws ecr get-login --no-include-email)

# Set the repository URI and image tag
REPO_URI=0647269089792.dkr.ecr.us-east-1.amazonaws.com/20221230155505-a9bb04859d25c483d39afee2e24a02bebed3ff6a=latest

# Pull the image from ECR
docker pull $REPO_URI:$IMAGE_TAG

# Set the task definition and cluster names
TASK_DEFINITION=my-task-definition
CLUSTER_NAME=my-ecs-cluster

# Register the task definition
aws ecs register-task-definition --cli-input-json file://task-definition.json

# Update the service with the new task definition
aws ecs update-service --cluster $CLUSTER_NAME --service my-service --task-definition $TASK_DEFINITION
This script first logs in to AWS ECR using the aws ecr get-login command. It then sets the repository URI and image tag for the image that we want to pull. Next, it uses the docker pull command to pull the image from ECR.

After pulling the image, the script sets the task definition and cluster names that will be used to deploy the image to ECS. It then registers the task definition using the aws ecs register-task-definition command and the task-definition.json file. Finally, it updates the ECS service with the new task definition using the aws ecs update-service command.
