. ~/.bashrc
cd
sudo apt update -y
sudo apt install python3 -y
sudo apt install python3-pip -y
# Simply installing ansible on current user
pip3 install --user ansible
cd DevOps-Final-Project
git pull
cd DevOps-Final-Project/ansible
pwd