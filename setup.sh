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

curl -sS https://starship.rs/install.sh | sh


mkdir -p ~/.config 



rm ~/.bashrc
curl -o ~/.bashrc https://raw.githubusercontent.com/ortizmeraz/PublicFiles/main/.bashrc

rm ~/.config/fish/config.fish
curl -o ~/.config/fish/config.fish https://raw.githubusercontent.com/ortizmeraz/PublicFiles/main/config.fish

rm ~/.config/starship.toml
curl -o ~/.config/starship.toml https://raw.githubusercontent.com/ortizmeraz/PublicFiles/main/starship.toml

cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

mkdir -p ~/.config/tmux

rm ~/.tmux.conf.local
curl -o ~/.tmux.conf.local https://raw.githubusercontent.com/ortizmeraz/PublicFiles/main/tmux.conf.local


sudo apt install fonts-firacode
fc-cache -f -v

wget https://raw.githubusercontent.com/ortizmeraz/PublicFiles/refs/heads/main/.bashrc