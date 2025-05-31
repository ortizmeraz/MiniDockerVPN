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
sudo nala install samba

curl -sS https://starship.rs/install.sh | sh

mkdir -p ~/.config 

rm ~/.bashrc
wget https://raw.githubusercontent.com/ortizmeraz/PublicFiles/refs/heads/main/.bashrc

rm ~/.config/fish/config.fish
curl -o ~/.config/fish/config.fish https://raw.githubusercontent.com/ortizmeraz/PublicFiles/main/config.fish

rm ~/.config/starship.toml
curl -o ~/.config/starship.toml https://raw.githubusercontent.com/ortizmeraz/PublicFiles/main/starship.toml

sudo nala install fonts-firacode
fc-cache -f -v

mkdir -p ~/data
chmod 0755 ~/data

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