#!/bin/bash

# SSH into the EC2 instance.
ssh my-ec2-instance << EOF
  # You now want to stop the running Docker container.
  docker stop (the name of the app you created)

  # You now want to pull the latest image from the ECR repository.
  docker pull "647269089792.dkr.ecr.us-east-2.amazonaws.com/bftesting:$commit_hash"

  # You now want to start a new Docker container using the latest image.
  docker run -d -p 80:80 --name my-app "647269089792.dkr.ecr.us-east-2.amazonaws.com/bftesting:$commit_hash"
EOF