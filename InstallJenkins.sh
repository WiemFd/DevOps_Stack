#! /bin/bash

# Install Java
yum install java-11-amazon-corretto.x86_64  -y

# Download and Install Jenkins
yum update –y
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
yum install fontconfig java-11-openjdk -y
yum install jenkins -y

# Start Jenkins
systemctl start jenkins

# Enable Jenkins with systemctl
systemctl enable jenkins

# Install Git 
yum install git -y

# Make sure Jenkins comes up/on when reboot
chkconfig jenkins on