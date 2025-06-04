#!/usr/bin/env bash
sudo apt update
sudo apt upgrade -y
sudo apt install nala -y

sudo nala install neofetch -y
sudo nala install python3 -y
sudo nala install curl -y
sudo nala install ranger -y
sudo nala install btop -y
sudo nala install eza -y
sudo nala install tmux -y
sudo nala install fish -y
sudo nala install bat -y
sudo nala install python3-pip -y
sudo nala install samba -y
sudo nala install git -y
sudo nala install tree -y

curl -sS https://starship.rs/install.sh | sh

mkdir .config 

rm ~/.bashrc
wget https://raw.githubusercontent.com/ortizmeraz/PublicFiles/refs/heads/main/.bashrc

curl -o ~/.config/fish/config.fish https://raw.githubusercontent.com/ortizmeraz/PublicFiles/main/config.fish

curl -o ~/.config/starship.toml https://raw.githubusercontent.com/ortizmeraz/PublicFiles/main/starship.toml

sudo nala install fonts-firacode
fc-cache -f -v

sudo tee -a /etc/samba/smb.conf << 'EOF'

[Data]
  comment = Personal Data Share
  path = /home/yourusername/data
  browseable = yes
  read only = no
  guest ok = yes
  create mask = 0755
  directory mask = 0755
EOF

sudo ufw allow samba

sudo smbpasswd -a omar
sudo systemctl restart smbd nmbd

curl -fsSL https://get.docker.com | sh

sudo usermod -aG docker $(whoami)

sudo nala install docker-compose -y

cp -r MiniDockerVPN/docker/ ~/ 
cp MiniDockerVPN/redock.sh ~/
sudo rm MiniDockerVPN/ -R
mkdir data
chmod 0755 ~/data
sudo reboot

# sudo mount -t cifs //192.168.0.16/data /home/omar/data   -o username=omar,uid=omar,gid=omar,file_mode=0640,dir_mode=0750