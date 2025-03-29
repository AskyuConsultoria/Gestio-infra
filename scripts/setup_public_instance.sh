#!/bin/bash
PUBLIC_IP=$1
PRIVATE_IP=$2

echo "server {
    listen 80;
    server_name $PUBLIC_IP;

    root /var/www/html/public;
    index index.html;

    location / {
        try_files \$uri \$uri/ /index.html;
    }

    location /askyu {
    proxy_pass http://backend-container:8080/askyu;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
    }
}" > default.conf


git clone https://github.com/AskyuConsultoria/Gestio-deployment-website.git
git clone --branch deploy-2025-03-14 --single-branch https://github.com/AskyuConsultoria/Gestio-front-api.git
git clone https://github.com/AskyuConsultoria/Gestio-deployment-backend.git

sudo apt update -y
sudo apt upgrade -y

curl -fsSL https://get.docker.com -o get-docker.sh

sudo docker build -t backend-image -f ./Gestio-deployment-backend/backend.dockerfile .
sudo docker run --name backend-container --network host -e SPRING_DATASOURCE_URL=jdbc:mysql://10.0.1.226:3306/askyu -d -p 8080:8080 backend-image 

sudo docker build -t website-image -f Gestio-deployment-website/install_website.dockerfile .
sudo docker run --name website-container --network host -d -p 80:80 website-image


