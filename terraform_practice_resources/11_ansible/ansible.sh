#!/bin/bash

sudo yum update -y
sudo yum install ansible -y
git clone https://github.com/Nageswar5050/ansible_roles_tf
cd ansible_roles_tf
ansible-playbook -i inventory.ini -e "component=mongo" -e "env=dev" main.yml
ansible-playbook -i inventory.ini -e "component=catalogue" -e "env=dev" main.yml
ansible-playbook -i inventory.ini -e "component=cart" -e "env=dev" main.yml
ansible-playbook -i inventory.ini -e "component=user" -e "env=dev" main.yml
ansible-playbook -i inventory.ini -e "component=payment" -e "env=dev" main.yml
ansible-playbook -i inventory.ini -e "component=shipping" -e "env=dev" main.yml
ansible-playbook -i inventory.ini -e "component=mysql" -e "env=dev" main.yml
ansible-playbook -i inventory.ini -e "component=rabbitmq" -e "env=dev" main.yml
ansible-playbook -i inventory.ini -e "component=redis" -e "env=dev" main.yml
ansible-playbook -i inventory.ini -e "component=web" -e "env=dev" main.yml