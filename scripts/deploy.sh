.~/.bashrc


sudo docker-compose build
sudo docker-compose push
sudo docker-compose up -d

ssh jenkins@swarm-master << EOF
cd /home/
. /home/
docker stack deploy --compose-file docker-compose.yaml stackcode
EOF
