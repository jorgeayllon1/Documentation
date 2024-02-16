#!/bin/bash

if [ $1 -eq 1 ]
then
    sudo cp wsl.conf /etc/ && sudo sed -i -r "s/custom/${2}/g" /etc/wsl.conf
    echo "Need to restart wsl to use wsl.conf."
elif [ $1 -eq 2 ]
then
    sudo dnf -y update && sudo dnf -y upgrade

    python3 -m ensurepip --upgrade
    python3 -m pip cache purge

    # Installation de docker
    sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
    sudo groupadd docker
    sudo usermod -aG docker $USER

    # Installation de podman
    # sudo dnf -y install podman

    echo "Need to restart shell to reload groups for docker"
elif [ $1 -eq 3 ]
then

    # Start docker
    sudo systemctl enable --now docker

    # Download minikue
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm
    sudo rpm -Uvh minikube-latest.x86_64.rpm
    rm minikube-latest.x86_64.rpm
    cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.29/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.29/rpm/repodata/repomd.xml.key
EOF

    # install kubectl
    sudo dnf install -y kubectl bash-completion

    # Clean cache
    sudo dnf clean all

    source /usr/share/bash-completion/bash_completion
    type _init_completion
    echo 'alias ll="ls --group-directories-first -phAl --color=auto"' >>~/.bashrc
    echo 'source <(kubectl completion bash)' >>~/.bashrc
    source ~/.bashrc

    minikube start
    echo "Done."
fi