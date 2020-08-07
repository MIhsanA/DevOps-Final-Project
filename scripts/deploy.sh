ssh Team2@51.132.240.149 << EOF
sudo rm -rf DevOps-Practical
git clone https://github.com/MIhsanA/DevOps-Final-Project -b Development
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
cd
cd DevOps-Practical
docker stack deploy --compose-file docker-compose.yaml springappstack
sudo docker-compose pull
sudo docker volume create springapp
EOF

