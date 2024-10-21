#!/bin/bash

green='\033[0;32m'
nc='\033[0m'

wget https://raw.githubusercontent.com/88n77/Logo-88n77/main/logo.sh
chmod +x logo.sh
./logo.sh

echo -e "${green}Оновлюємо та встановлюємо необхідні пакети...${nc}"
sudo apt update && sudo apt upgrade -y 
sudo apt install jq -y

echo -e "${green}Встановлюємо Docker...${nc}"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg 
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null 
sudo apt-get update 
sudo apt-get install docker-ce docker-ce-cli containerd.io -y 
docker version

echo -e "${green}Встановлюємо Docker Compose...${nc}"
VER=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d '"' -f 4) 
curl -L "https://github.com/docker/compose/releases/download/$VER/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose 
chmod +x /usr/local/bin/docker-compose 
docker-compose --version

echo -e "${green}Відкриваємо порт 31333...${nc}"
sudo ufw allow 31333

echo -e "${green}Запускаємо скрипт для встановлення ноди...${nc}"
bash <(curl -s https://raw.githubusercontent.com/nesaorg/bootstrap/master/bootstrap.sh) <<EOF

EOF