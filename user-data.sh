#!/bin/bash
yum update -y
amazon-linux-extras install docker -y
service docker start
usermod -a -G docker ec2-user

# Install git and clone the repo (replace with your own if needed)
yum install -y git

# clone your code (or use S3/artifact download if preferred)
git clone https://github.com/kuldip2109/ECR-ECS.git /home/ec2-user/app

# Build and run container
cd /home/ec2-user/app/app
docker build -t flask-app .
docker run -d -p 80:80 flask-app
