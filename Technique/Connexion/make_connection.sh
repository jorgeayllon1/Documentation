#!/bin/bash

FILE_KEY=~/.ssh/id_ed25519_ansible.pub
user=$1
remote_address=$2
password=$3

if ! [ -e "$FILE_KEY" ]; then
    ssh-keygen -q -t ed25519 -b 4096 -N '' -f ~/.ssh/id_ed25519_ansible >/dev/null 2>&1
fi

ssh -q -o BatchMode=yes -i ~/.ssh/id_ed25519_ansible ${user}@${remote_address} exit
EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ]; then
    ssh-keyscan ${remote_address} >> ~/.ssh/known_hosts 2>/dev/null
    sshpass -p ${password} ssh-copy-id -i ~/.ssh/id_ed25519_ansible.pub ${user}@${remote_address} 2>/dev/null
    sshpass -p ${password} ssh -i ~/.ssh/id_ed25519_ansible ${user}@${remote_address} 2>/dev/null
else
    sshpass -p ${password} ssh -i ~/.ssh/id_ed25519_ansible ${user}@${remote_address} 2>/dev/null
fi
