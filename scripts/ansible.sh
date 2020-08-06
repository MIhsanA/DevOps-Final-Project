. ~/.bashrc
mkdir -p ~/.local/bin
echo 'PATH=$PATH:~/.local/bin' >> .bashrc
source .bashrc
cd
sudo apt update -y
sudo apt install python3 -y
sudo apt install python3-pip -y
pip3 install --user ansible
cd DevOps-Final-Project
git pull
cd ansible
pwd
ansible-playbook -i inventory playbook.yaml