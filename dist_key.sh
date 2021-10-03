#!/bin/bash

ansible all -m user -a "name=ansible" -u root --ask-pass 
ansible all -m authorized_key -a "user=ansible key='{{ lookup('file','/home/ansible/.ssh/id_rsa.pub')}}'" -u root --ask-pass
ansible all -m lineinfile -a "path=/etc/sudoers line='ansible        ALL=(ALL)       NOPASSWD: ALL'" -u root --ask-pass
