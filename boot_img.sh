#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo mkdir /var/www/html/images
sudo chmod 777 /var/www/html/images
cd /var/www/html/images
sudo wget https://prdxteam2.s3.amazonaws.com/ninja.png
sudo wget https://prdxteam2.s3.amazonaws.com/index-images.html
mv index-images.html index.html
sudo systemctl enable httpd --now
