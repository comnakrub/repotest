# Use an official Jenkins LTS (Long Term Support) base image
FROM jenkins/jenkins:lts
 
# Switch to root user to install additional software
USER root
 
# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y \
    unzip \
    wget \
&& rm -rf /var/lib/apt/lists/*
 
# Set Terraform version
ENV TERRAFORM_VERSION=1.7.2
 
# Download and install Terraform
RUN wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -O /tmp/terraform.zip && \
    unzip /tmp/terraform.zip -d /usr/local/bin && \
    rm /tmp/terraform.zip
 
# Switch back to the Jenkins user
USER jenkins