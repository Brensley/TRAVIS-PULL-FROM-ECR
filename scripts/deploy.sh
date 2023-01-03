# Build the Docker image
docker build -t bfosterapp .

# Tag the image with the current version and the ECR repository URI
docker tag my-app:latest 0647269089792.dkr.ecr.us-east-1.amazonaws.com/m20221230155505-a9bb04859d25c483d39afee2e24a02bebed3ff6a:$TRAVIS_COMMIT

# Push the image to ECR
docker push 0647269089792.dkr.ecr.us-east-1.amazonaws.com/20221230155505-a9bb04859d25c483d39afee2e24a02bebed3ff6a:$TRAVIS_COMMIT

# Create the ECS cluster (if it doesn't already exist)
aws ecs create-cluster --cluster-name bfcluster

# Create the ECS task definition
aws ecs register-task-definition --cli-input-json file://task-def.json

# Create the ECS service
aws ecs create-service --cluster bfcluster --service-name bfcluster my-service --task-definition task-def --desired-count 1

# Update the ECS task definition with the new image
aws ecs update-service --cluster my-cluster --service bfcluster --task-definition task-def --force-new-deployment