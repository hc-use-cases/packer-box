#!/bin/bash

# Install Ansible repository.
apt -y install software-properties-common
apt-add-repository ppa:ansible/ansible

# Install Ansible.
apt -y install ansible