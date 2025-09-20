#!/bin/bash

# Update system
sudo apt-get update -y

# Install Java 17
sudo apt-get install -y openjdk-17-jdk-headless

# Download and add Jenkins key
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# Add Jenkins repo
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update and install Jenkins
sudo apt-get update -y
sudo apt-get install -y jenkins

# Ensure Jenkins directories exist
sudo mkdir -p /var/cache/jenkins/war
sudo chown -R jenkins:jenkins /var/lib/jenkins /var/log/jenkins /var/cache/jenkins
sudo chmod -R 755 /var/lib/jenkins /var/log/jenkins /var/cache/jenkins

# Start Jenkins
sudo systemctl daemon-reexec
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Install Terraform
TERRAFORM_VERSION="1.6.5"
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
sudo apt-get install -y unzip
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
sudo mv terraform /usr/local/bin/
rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip
