#!/bin/bash

# Install Java
yum update -y
yum install java-1.8* -y
amazon-linux-extras install java-openjdk11 -y
update-alternatives --set java java-11-openjdk.x86_64

# Install Git
yum install git -y

# Install Jenkins
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat/jenkins.io-2023.key
yum upgrade -y
yum install -y jenkins

# Install Maven
cd /opt/
wget https://archive.apache.org/dist/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz
tar -xvzf apache-maven-3.2.5-bin.tar.gz
mv apache-maven-3.2.5 maven
cd

# Install Docker
yum install -y docker
systemctl start docker

# Install Node.js and npm
curl -sL https://rpm.nodesource.com/setup_16.x | sudo bash -
sudo yum install -y nodejs
sudo npm install -g npm@8.19.4

# Install Angular CLI
sudo npm install -g @angular/cli@16.0.5


# Configure sudoers file to allow Jenkins user to run commands
echo 'jenkins ALL=(ALL) NOPASSWD: ALL' | tee /etc/sudoers.d/jenkins
chmod 440 /etc/sudoers.d/jenkins
chown root:root /etc/sudoers.d/jenkins

# Specify the desired values for JAVA_HOME, M2, and M2_HOME
JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.342.b07-1.amzn2.0.1.x86_64"
M2="/opt/maven"
M2_HOME="/opt/maven/bin"

# Update the .bash_profile file
echo "export JAVA_HOME=$JAVA_HOME" >> ~/.bash_profile
echo "export M2=$M2" >> ~/.bash_profile
echo "export M2_HOME=$M2_HOME" >> ~/.bash_profile

# Update the current shell session with the new environment variables
export JAVA_HOME=$JAVA_HOME
export M2=$M2
export M2_HOME=$M2_HOME

# Start Jenkins and Tomcat services
systemctl start jenkins
systemctl enable jenkins
systemctl enable docker
