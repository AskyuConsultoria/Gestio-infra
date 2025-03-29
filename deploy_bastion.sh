#!/bin/bash
PUBLIC_IP=$1
PRIVATE_IP=$2
BASTION_KEY="./chaves/pbkey-ges" 
USER="ubuntu"

chmod +x generate_conf.sh 
bash generate_conf.sh $PUBLIC_IP

scp -i "$BASTION_KEY" -o StrictHostKeyChecking=no "default.conf" "$USER@$PUBLIC_IP:/home/ubuntu"

ssh -i "$BASTION_KEY" "$USER@$PUBLIC_IP" << EOF
 git clone https://github.com/AskyuConsultoria/Gestio-deployment-website.git
 git clone --branch deploy-2025-03-14 --single-branch https://github.com/AskyuConsultoria/Gestio-front-api.git
 git clone https://github.com/AskyuConsultoria/Gestio-deployment-backend.git

 sudo apt update -y
 sudo apt upgrade -y

 curl -fsSL https://get.docker.com -o get-docker.sh

 if ! command -v docker &> /dev/null; then
   echo "Docker não encontrado. Instalando..."
   sudo sh get-docker.sh
   echo "Docker instalado com sucesso!"
 else
   echo "Docker já está instalado. Pulando a instalação."
 fi

 sudo docker build -t backend-image -f ./Gestio-deployment-backend/backend.dockerfile .
 sudo docker run --name backend-container --network host -e SPRING_DATASOURCE_URL="jdbc:mysql://$PRIVATE_IP:3306/askyu" -d -p 8080:8080 backend-image 

 sudo docker build -t website-image -f Gestio-deployment-website/install_website.dockerfile .
 sudo docker run --name website-container --network host -d -p 80:80 website-image
EOF



