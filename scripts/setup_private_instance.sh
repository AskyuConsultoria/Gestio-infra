sudo apt update -y
sudo apt upgrade -y
git clone https://github.com/AskyuConsultoria/Gestio-deployment-backend.git
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo docker build -t mysql-image -f mysql.dockerfile .
sudo docker run --name mysql-container --network host -d -p 3306:3306 mysql-image 

