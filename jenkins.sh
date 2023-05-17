#!/bin/bash
              
              # Install Java
              yum update -y
              yum install java-1.8* -y
              amazon-linux-extras install java-openjdk11 -y
              update-alternatives --set java java-11-openjdk.x86_64

              yum install git -y
              
              # Install Jenkins
              wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
              rpm --import https://pkg.jenkins.io/redhat/jenkins.io-2023.key
              yum upgrade -y
              yum install -y jenkins
              
              # Install Maven
              yum install -y maven
              
              # Install Tomcat
              wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.0.M17/bin/apache-tomcat-9.0.0.M17.tar.gz -P /opt
              tar xf /opt/apache-tomcat-9.0.0.M17.tar.gz -C /opt
              ln -s /opt/apache-tomcat-9.0.0.M17 /opt/tomcat

              # Allow remote access to Tomcat
              sed -i 's/<Connector port="8080"/<Connector port="8081" address="0.0.0.0"/' /opt/tomcat/conf/server.xml

              # Start Tomcat
              /opt/tomcat/bin/shutdown.sh
              /opt/tomcat/bin/startup.sh
              
              # Configure sudoers file
              echo 'jenkins ALL=(ALL) NOPASSWD: ALL' | tee /etc/sudoers.d/jenkins
              chmod 440 /etc/sudoers.d/jenkins
              chown root:root /etc/sudoers.d/jenkins
              
              # Install Docker
              yum install -y docker
              systemctl start docker
              
              # Start Jenkins and Tomcat services
              systemctl start jenkins
              systemctl enable jenkins
              systemctl enable docker



              
              