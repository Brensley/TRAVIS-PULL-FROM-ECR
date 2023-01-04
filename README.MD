# Below you will find the decription on what each file does. (Line 4 through 18)
# On line (21 through 49 I pointed out what needs to be chagned.)

# The .travis.yml file specifies the language (bash) and services (Docker) to use for the build, as well
# as #the scripts to run before install and during the build process.

# The install-aws-cli.sh script installs the AWS CLI and adds it to the PATH. This is necessary for the  
# other scripts to be able to use the aws command.

# The login-to-ecr.sh script logs in to the ECR repository using the aws ecr get-login command, which  
# retrieves a login command that includes an authentication token. The script then runs the login command # to authenticate the Docker CLI with the ECR registry.

# The build-and-push-image.sh script builds the Docker image using the docker build command, tags the 
# image #with the current Git commit hash using the docker tag command, and pushes the image to the ECR  
# repository #using the docker push command.

# The create-ec2-instance.sh script creates an EC2 instance using the aws ec2 run-instances command and  
# stores the instance ID in an environment variable.

# The wait-for-ec2-instance.sh script waits for the EC2 instance to be in a "running" state using the aws # ec2 wait command, and then retrieves the public IP address of the instance using the aws ec2 
# describe-instances command. The script then updates the ~/.ssh/config file to use the correct IP address # for SSH.

# The deploy-to-ec2.sh script SSHs into the EC2 instance using the hostname specified in the ~/.ssh/config # file. It then stops the running Docker container using the docker stop command, pulls the latest image  # from the ECR repository using the docker pull command, and starts a new Docker container using the  
# latest #image and the docker run command.


# IN THE FOLLOWING BELOW, PLEASE MAKE CHANGES TO THE CORRESPONDING SCRIPT. (.travis.yml, install-aws-cli.sh, login-to-ecr.sh, build-and-push-image.sh, create-ec2-instance.sh wait-for-ec2-instance.sh and deploy-to-ec2.sh)

# For the .travis.yml 
# No changes are needed to this file.

# For the install-aws-cli.sh:
# No changes are needed to this file.

# For the login-to-ecr.sh:
# Replace my-app with the name of your ECR repository.

###### For the build-and-push-image.sh:
# Replace my-app with the name of your Docker image.
# Replace my-app with the name of your ECR repository.

###### For the create-ec2-instance.sh:
# Replace $AMI with the ID of the Amazon Machine Image (AMI) you want to use for your EC2 instance.
# Replace $INSTANCE_TYPE with the instance type you want to use for your EC2 instance (e.g. t2.micro).
# Replace $KEY_NAME with the name of the key pair you want to use for your EC2 instance.
# Replace $SECURITY_GROUP_IDS with the IDs of the security groups you want to use for your EC2 instance.
# Replace $SUBNET_ID with the ID of the subnet you want to launch your EC2 instance in.

###### For the wait-for-ec2-instance.sh:
# Replace my-ec2-instance with the hostname you want to use for your EC2 instance.

###### For the deploy-to-ec2.sh:
# Replace my-ec2-instance with the hostname you specified in the wait-for-ec2-instance.sh script.
# Replace my-app with the name of your Docker container.
# Replace my-app with the name of your ECR repository.