#!/bin/bash

apt-get update -yq
apt-get install python3-pip -yq

mkdir /app 

cp -r devops_todolist_terraform_task/app/* /app

mv /app/todoapp.service /etc/systemd/system/
systemctl daemon-reload
systemctl start todoapp
systemctl enable todoapp
