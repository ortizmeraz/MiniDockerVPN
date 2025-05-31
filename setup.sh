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

curl -sS https://starship.rs/install.sh | sh

mkdir -p ~/.config 
mkdir -p ~/data
chmod 0755 ~/data

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

sudo reboot
sudo nala install docker-compose -y


set -euo pipefail

# 1) Change into the MiniDockerVPN folder (adjust path if needed)
cd ~/MiniDockerVPN

# 2) Enable dotglob so “*” also matches hidden files (like .gitignore)
shopt -s dotglob

# 3) Move everything from here into your home directory
mv * ~/

# 4) Disable dotglob again (restore normal globbing)
shopt -u dotglob


grep -Fqx '//192.168.0.16/data ~/data cifs credentials= ~/.config/.smbcredentials,uid=omar,gid=omar,file_mode=0640,dir_mode=0750,_netdev 0 0' /etc/fstab \
  || echo '//192.168.0.16/data ~/data cifs credentials= ~/.config/.smbcredentials,uid=omar,gid=omar,file_mode=0640,dir_mode=0750,_netdev 0 0' | sudo tee -a /etc/fstab


# 1) Prompt for the Samba password (input hidden)
read -sp "Enter Samba password for user omar: " samba_pass
echo    # newline after hidden input

# 2) Ensure the config directory exists
mkdir -p ~/.config

# 3) Write the credentials file
cat <<EOF > ~/.config/.smbcredentials
username=omar
password=$samba_pass
EOF

# 4) Secure it so only you can read/write
chmod 600 ~/.config/.smbcredentials

echo "✓ Created ~/.config/.smbcredentials"

sudo reboot