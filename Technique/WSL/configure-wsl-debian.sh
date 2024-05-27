#!/bin/bash

if [ $1 -eq 1 ]
then
    sudo cp wsl.conf /etc/ && sudo sed -i -r "s/custom/$USER/g" /etc/wsl.conf
    echo "Need to restart wsl to use wsl.conf."
elif [ $1 -eq 2 ]
then
    sudo apt update && sudo apt -y upgrade
    sudo apt install -y python3 python3-pip

    # Add Docker's official GPG key:
    sudo apt install -y ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update

    # Install Docker
    sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    sudo usermod -aG docker $USER
    newgrp docker

elif [ $1 -eq 3 ]
then
    # Install minikube
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
    sudo dpkg -i minikube_latest_amd64.deb
    rm minikube_latest_amd64.deb

    # Install kubectl
    sudo apt install -y apt-transport-https ca-certificates curl gnupg

    curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
    sudo chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg

    echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
    sudo chmod 644 /etc/apt/sources.list.d/kubernetes.list

    sudo apt update
    sudo apt install -y kubectl bash-completion

    # Install helm
    sudo apt install -y git
    curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

    # Clean cache
    sudo apt autoclean && sudo apt autoremove

    # echo "Done. Need to restart terminal."
    # Configure linux
    source /usr/share/bash-completion/bash_completion
    type _init_completion
    echo 'alias ll="ls --group-directories-first -phAl --color=auto"' >>~/.bashrc
    echo 'source <(kubectl completion bash)' >>~/.bashrc
    source ~/.bashrc

    # Configure minikube
    minikube config set driver docker
    minikube config set container-runtime docker
    echo "Done. Restart Terminal."
fi