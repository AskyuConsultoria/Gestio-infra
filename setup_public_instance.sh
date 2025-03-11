#!/bin/bash
PUBLIC_IP=$1

echo "server {
    listen 80;
    server_name $PUBLIC_IP;

    root /var/www/html/public;
    index index.html;

    location / {
        try_files \$uri \$uri/ /index.html;
    }

    error_page 404 =200 /index.html;
}" > ./default.conf

git clone https://github.com/AskyuConsultoria/Gestio-deployment-website.git
sudo apt update -y
sudo apt upgrade -y
git clone https://github.com/AskyuConsultoria/Gestio-front-api.git
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo docker build -t website-image -f Gestio-deployment-website/install_website.dockerfile .
sudo docker run --name website-container -d -p 80:80 website-image
