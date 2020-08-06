sudo apt update -y
sudo apt install python3 -y
sudo apt install python3-pip -y
# Simply installing ansible on current user
pip3 install --user ansible
# Verifying Ansible is installed will show on logs
ansible --version
cd DevOps-Final-Project
git pull
cd DevOps-Final-Project/ansible
ansible-playbook -i inventory playbook.yaml