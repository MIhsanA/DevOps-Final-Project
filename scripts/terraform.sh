. ~/.bashrc
mkdir -p ~/.local/bin
echo 'PATH=$PATH:~/.local/bin' >> .bashrc
source .bashrc
cd
sudo apt update -y
sudo apt update && sudo apt upgrade -y
sudo apt install -y unzip wget
wget https://releases.hashicorp.com/terraform/0.12.12/terraform_0.12.12_linux_amd64.zip
unzip terraform_*_linux_*.zip
sudo mv terraform /usr/local/bin
rm terraform_*_linux_*.zip
git clone https://github.com/MIhsanA/DevOps-Final-Project.git -b Development
cd DevOps-Final-Project
pwd 