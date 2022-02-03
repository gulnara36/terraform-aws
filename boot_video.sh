#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo mkdir /var/www/html/videos
sudo chmod 777 /var/www/html/videos
cd /var/www/html/videos
sudo wget https://prdxteam2.s3.amazonaws.com/module-free.gif
sudo wget https://prdxteam2.s3.amazonaws.com/index-gif.html
mv index-gif.html index.html
sudo systemctl enable httpd --now
