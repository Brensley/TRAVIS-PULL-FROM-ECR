#!/bin/bash

# Install the AWS CLI.
pip install --upgrade --user awscli

# Now add the AWS CLI to the PATH.
echo 'export PATH=$PATH:$HOME/.local/bin' >> ~/.bashrc
source ~/.bashrc