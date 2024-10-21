#!/bin/bash

green='\033[0;32m'
nc='\033[0m'

# Видалення ноди
echo -e "${green}Видаляємо ноду...${nc}"
sudo docker stop orchestrator 
sudo docker stop ipfs_node
sudo docker rm orchestrator 
sudo docker rm ipfs_node

echo -e "${green}Перегляд...${nc}"
sudo docker images

echo -e "${green}Видаляємо...${nc}"
sudo docker rmi ghcr.io/nesaorg/orchestrator:devnet-latest 
sudo docker rmi ipfs/kubo:latest

echo -e "${green}Очищаємо, ноду видалено..${nc}"
sudo docker image prune -a
