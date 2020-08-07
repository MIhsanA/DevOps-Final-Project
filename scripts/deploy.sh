ssh Team2@51.132.240.149 << EOF
sudo rm -rf DevOps-Practical
git clone https://github.com/MIhsanA/DevOps-Final-Project -b Development
cd DevOps-Practical
sudo docker-compose pull
sudo docker volume create springapp
EOF