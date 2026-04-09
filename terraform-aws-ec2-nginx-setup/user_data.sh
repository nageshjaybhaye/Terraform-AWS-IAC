#!/bin/bash
sudo yum update -y
sudo yum install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
echo "<h1>Welcome to Terraform EC2 Instance</h1>" | sudo tee /var/www/html/index.html