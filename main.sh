#!/bin/bash

set -e 

echo "[1] Inicializando o Terraform..."
terraform init

echo "[2] Aplicando o Terraform..."
terraform apply -var-file="envs/dev.tfvars" -auto-approve

echo "[3] Aguardando output do Terraform..."
PUBLIC_IP=$(terraform output -raw bastion_public_ip)
PRIVATE_IP=$(terraform output -raw private_instance_ip)

if [[ -z "$PUBLIC_IP" || -z "$PRIVATE_IP" ]]; then
  echo "❌ Erro: Não foi possível obter os IPs das instâncias!"
  exit 1
fi


echo "[4] Iniciando provisionamento..."
chmod +x deploy.sh
./deploy.sh "$PUBLIC_IP" "$PRIVATE_IP"

chmod +x deploy_bastion.sh
./deploy_bastion.sh "$PUBLIC_IP" "$PRIVATE_IP"

echo "[5] Infraestrutura criada com sucesso!"
echo "[6] IPs obtidos com sucesso!"
echo "   - IP Público: $PUBLIC_IP"
echo "   - IP Privado: $PRIVATE_IP"
