#!/bin/bash

# Update apt package index
sudo apt update

# Install dependency packages
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Download Docker’s official GPG key and add it to Docker’s keyring
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/docker-archive-keyring.gpg >/dev/null

# Set up Docker's stable version repository and automatically enter the Enter key
echo | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null <<EOF
deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable
EOF

# Update apt package index
sudo apt update

# Install Docker CE
sudo apt install -y docker-ce

# Start the Docker service
sudo systemctl start docker

# Verify whether Docker is installed successfully
docker --version
