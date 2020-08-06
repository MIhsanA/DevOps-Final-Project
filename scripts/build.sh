sudo su - jenkins
# Making sure ~/.local/bin Exists
mkdir -p ~/.local/bin
echo 'PATH=$PATH:~/.local/bin' >> .bashrc
source .bashrc
#installing prerequisites to install ansible
## python 3 & pip is needed to to install ansible
sudo apt update -y
sudo apt install python3 -y
sudo apt install python3-pip -y
# Simply installing ansible on current user
sudo pip3 install --user ansible
# Verifying Ansible is installed will show on logs
sudo ansible --version
#pull version
sudo cd /DevOps-Final-Project
sudo git pull
#locate to root
sudo cd ansible
#Running inventory & playbooks
sudo ansible-playbook -i inventory playbook.yaml
