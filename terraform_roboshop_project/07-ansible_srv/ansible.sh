#!/bin/bash
sudo yum install ansible -y
cd /tmp
git clone https://github.com/Nageswar0550/roboshop_project.git
cd roboshop_project/ansible_roles
ansible-playbook -i inventory.ini -e component=mongodb main.yml
ansible-playbook -i inventory.ini -e component=user main.yml
ansible-playbook -i inventory.ini -e component=cart main.yml
ansible-playbook -i inventory.ini -e component=shipping main.yml
ansible-playbook -i inventory.ini -e component=payment main.yml
ansible-playbook -i inventory.ini -e component=catalogue main.yml
ansible-playbook -i inventory.ini -e component=redis main.yml
ansible-playbook -i inventory.ini -e component=mysql main.yml
ansible-playbook -i inventory.ini -e component=rabbitmq main.yml
ansible-playbook -i inventory.ini -e component=web main.yml