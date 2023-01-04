#!/bin/bash

# This will build the Docker image.
docker build -t 20221230155505-a9bb04859d25c483d39afee2e24a02bebed3ff6a .

# Now get the current Git commit hash.
commit_hash=$(git rev-parse --short HEAD)

# Now tag the image with the commit hash.
docker tag my-app:latest "647269089792.dkr.ecr.us-east-2.amazonaws.com/bftesting:20221230155505-a9bb04859d25c483d39afee2e24a02bebed3ff6a:$commit_hash"

# This will now push the image to the ECR repository.
docker push "647269089792.dkr.ecr.us-east-2.amazonaws.com/bftesting:20221230155505-a9bb04859d25c483d39afee2e24a02bebed3ff6a:$commit_hash"