#! bin/bash

# Installing Docker 

# STEP-1 Updating current distro of linux (This works with ubuntu)
sudo apt update -Y
# STEP-2 Adding pre-requisite packages
sudo apt install apt-transport-https ca-certificates curl software-properties-common
# STEP-3 Adding GPG Keys from Docker offical Repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# STEP-4 Add the Docker repository to APT sources:
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
# STEP-5 Checking Policy
apt-cache policy docker-ce
# STEP-6 Installing Docker
sudo apt install docker-ce
# STEP-7 Checking status of Docker
sudo systemctl status docker
# STEP-8 Providing Root Privilidges to docker group so that user doesnt have to write sudo everytime
sudo usermod -aG docker ${USER}

# Installing Minikube

sudo apt-get update -y

sudo apt-get upgrade -y

sudo apt-get install curl

sudo apt install -y virtualbox virtualbox-ext-pack

#Next, the licence agreement appears on the screen. Press Tab and then Enter to continue.
#The installer asks you to agree with the terms of the VirtualBox PUEL license by selecting Yes.

wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

sudo cp minikube-linux-amd64 /usr/local/bin/minikube

sudo chmod 755 /usr/local/bin/minikube

minikube version

# Installing Kubectl

curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

chmod +x ./kubectl

sudo mv ./kubectl /usr/local/bin/kubectl

kubectl version -o json

# Start Minikube

minikube start