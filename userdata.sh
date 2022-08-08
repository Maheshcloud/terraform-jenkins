#!/bin/bash
sudo apt-get -y update
# Install OpenJDK 8
sudo apt-get -y install openjdk-8-jdk
# Install Jenkins
sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo echo "deb https://pkg.jenkins.io/debian-stable binary/" >> /etc/apt/sources.list
sudo apt-get -y update
sudo apt-get -y install jenkins


# Install terraform
sudo apt-get install wget unzip -y
sudo wget https://releases.hashicorp.com/terraform/0.14.7/terraform_0.14.7_linux_amd64.zip
sudo unzip terraform_0.14.7_linux_amd64.zip
sudo mv terraform /usr/local/bin/

# Install aws cli

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install



# Install Ansible

sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible

#Install Maven

sudo wget http://apache.mirrors.pair.com/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
#Once the download has completed, extract the downloaded archive.
sudo tar -xvzf apache-maven-3.6.3-bin.tar.gz
#Next, rename the extracted directory.
sudo mv apache-maven-3.6.3 maven 
export M2_HOME='/opt/maven'
export PATH=${M2_HOME}/bin:${PATH}
source ~/.bashrc


#Install Git

sudo apt update
#Run the following command to install Git:
sudo apt install git

#Install boto3
pip3 install boto3

#Install nginx

sudo apt update
sudo apt install nginx
sudo ufw allow 'Nginx HTTP'
sudo ufw status
stats=$(sudo ufw status | awk -F [:] '{ print $2 }')
if [ ${stats} == inactive ]
  then
    sudo ufw enable
  fi
sudo systemctl start nginx
