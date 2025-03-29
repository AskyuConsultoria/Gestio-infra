#!/bin/bash

PUBLIC_IP=$1 
PRIVATE_IP=$2   
BASTION_KEY="./chaves/pbkey-ges" 
PRIVATE_KEY="~/.ssh/pbkey-ges"  
LOCAL_FILE="./scripts/mysql.dockerfile"  
LOCAL_FILE_PUBLIC="mysql.dockerfile"
REMOTE_PATH="/tmp/"   # Diretório remoto
USER="ubuntu"


echo "[1] Enviando arquivo para a instância pública..."
scp -i "$BASTION_KEY" -o StrictHostKeyChecking=no "./scripts/get-docker.sh" "$USER@$PUBLIC_IP:$REMOTE_PATH"
scp -i "$BASTION_KEY" -o StrictHostKeyChecking=no "./scripts/mysql.dockerfile" "$USER@$PUBLIC_IP:$REMOTE_PATH"
scp -i "$BASTION_KEY" -o StrictHostKeyChecking=no "./scripts/database_hom_gestio.sql" "$USER@$PUBLIC_IP:$REMOTE_PATH"

if [ $? -ne 0 ]; then
  echo "❌ Erro ao enviar arquivos para a instância pública!"
  exit 1
fi

echo "[2] Concedendo permissões de leitura a ao diretório /tmp/"
ssh -i "$BASTION_KEY" "$USER@$PUBLIC_IP" << 'EOF'
  sudo chmod 777 /tmp/
  exit
EOF

if [ $? -ne 0 ]; then
  echo "❌ Erro ao conceder permissões para ao diretório da instância privada!"
  exit 1
fi

echo "[3] Enviando chave privada para a instância pública..."
scp -i "$BASTION_KEY" -o StrictHostKeyChecking=no "./chaves/pvkey-ges" "$USER@$PUBLIC_IP:~"

if [ $? -ne 0 ]; then
  echo "❌ Erro ao tentar enviar a chave privada para a instância pública."
  exit 1
fi

echo "[4] Conectando com SSH na instância pública"
ssh -i "$BASTION_KEY" "$USER@$PUBLIC_IP" << EOF
  echo "[5] Concedendo permissões válidas a chave privada"
  sudo chmod 600 /home/ubuntu/pvkey-ges

  
  echo "[5] Enviando dockerfile para a máquina privada"
  scp -i /home/ubuntu/pvkey-ges -o StrictHostKeyChecking=no "/tmp/get-docker.sh" "$USER@$PRIVATE_IP:/home/ubuntu"
  scp -i /home/ubuntu/pvkey-ges -o StrictHostKeyChecking=no "/tmp/mysql.dockerfile" "$USER@$PRIVATE_IP:/home/ubuntu"
  scp -i /home/ubuntu/pvkey-ges -o StrictHostKeyChecking=no "/tmp/database_hom_gestio.sql" "$USER@$PRIVATE_IP:/home/ubuntu"
  
  ssh -i /home/ubuntu/pvkey-ges "$USER@$PRIVATE_IP"

  sudo apt update -y
  sudo apt upgrade -y
  
  if ! command -v docker &> /dev/null; then
   echo "Docker não encontrado. Instalando..."
   sudo sh get-docker.sh
   echo "Docker instalado com sucesso!"
  else
   echo "Docker já está instalado. Pulando a instalação."
  fi

  sudo docker build -t mysql-image -f mysql.dockerfile .
  sudo docker run --name mysql-container --network host -d -p 3306:3306 mysql-image 

  exit
EOF

