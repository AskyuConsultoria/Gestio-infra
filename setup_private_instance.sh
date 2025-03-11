sudo apt update -y
sudo apt upgrade -y

git clone https://github.com/AskyuConsultoria/Gestio-back-api.git
git clone

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

sudo docker -t mysql-image -f mysql.dockerfile .
sudo docker build --name mysql-container -d -p 3306:3306 mysql-image 

echo '${file("application.properties")}' > /home/ubuntu/application.properties

