#!/bin/bash

sudo apt update && sleep 5;

sudo apt install -y ansible;
sleep 3;
echo "ansible installed"

echo "running playbook"
eval "${run}"
