ssh jenkins@51.137.151.109 << EOF
sudo apt update -y
sudo apt install python3 -y
sudo apt install python3-pip -y
# Simply installing ansible on current user
pip3 install --user ansible
# Verifying Ansible is installed will show on logs
ansible --version
#pull version
cd
pwd
cd /DevOps-Final-Project
git checkout Development
#locate to root
cd /DevOps-Final-Project/ansible
#Running inventory & playbooks
ansible-playbook -i inventory playbook.yaml
EOF