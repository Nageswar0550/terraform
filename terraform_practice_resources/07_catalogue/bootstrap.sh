#!/bin/bash

component=$1
environment=$2

yum install ansible python3.11-pip -y
pip3.11 install botocore boto3

ansible-pull -U https://github.com/Nageswar5050/ansible_roles_tf.git -e component=$component -e env=$environment main.yml