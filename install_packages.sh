#!/bin/bash

echo "Installing docker:"

sudo apt update 
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyrings

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update -y

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y


echo "Now installing packages from grey wolf"


#!/bin/bash

sudo apt-get update -y 

while IFS=$'\t' read -r package version origin; do
    echo "Installing $package ($version) from $origin repository"
    sudo apt-get install -y "$package"
done < /path/to/destination/directory/installed_packages_list.txt



