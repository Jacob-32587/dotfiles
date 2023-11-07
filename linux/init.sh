# #!/bin/bash
# set -v
# apt-get update
source ./functions.sh

# Create symbolic links for config dirs
backup_and_create_ln "$HOME/.dotfiles/starship.toml" "$HOME/.config"
backup_and_create_ln "$HOME/.dotfiles/carapace" "$HOME/.config"
backup_and_create_ln "$HOME/.dotfiles/nushell" "$HOME/.config"

pids=()

# Remove gnome keybinds, these were extremely annoying to find
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['']" &
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['']" &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['']" &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['']" &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['']" &
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['']" &
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['']" &
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['']" &

# Install VSCodium
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list

sudo apt update
sudo apt install codium

# Install CMake (if not already installed)
cmake --version
if [[ ! $? -eq 0 ]] ; then
    bash cmake_install.sh &
    cmake_pid=$!
fi

# Install Postgres (if not already installed)
psql --version
if [[ ! $? -eq 0 ]] ; then
    bash install_postgres.sh
fi
# Install Neovim
sudo apt install neovim

# Install Libre office
yes | sudo apt-get install libreoffice

# Install Clang 17
sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"

# Setup VSCodium settings
bash codium-setup.sh &

# Install curl
sudo apt install curl

# Instal NVM (node version manager)

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash &

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y &
pids+=( $! )

# Install Nushell
curl --proto '=https' --tlsv1.2 -L https://github.com/nushell/nushell/releases/download/0.86.0/nu-0.86.0-x86_64-linux-gnu-full.tar.gz --output nushell.tar.gz &
pids+=( $! )

# Install Carapace
if [ -d "/etc/apt/sources.list.d/fury.list" ] ;
then
    sudo touch 'fury.list'
    sudo chmod 777 fury.list
    sudo echo 'deb [trusted=yes] https://apt.fury.io/rsteube/ /' >> 'fury.list'
    sudo chmod 644 fury.list
    sudo mv 'fury.list' '/etc/apt/sources.list.d/'
fi

sudo apt-get update
sudo apt-get install carapace-bin
pids+=( $! )

# wait for all collected pids
for pid in ${pids[*]}; do
    wait $pid
done
pids=()
backup_dir "$HOME/.nushell"
tar -xf 'nushell.tar.gz' -C "$HOME/"
mv "$HOME/nu-0.86.0-x86_64-linux-gnu-full" "$HOME/.nushell"
rm 'nushell.tar.gz'

wait $cmake_pid

# Need access to commands that nu, rust, and cmake provide
add_script_if_not_exist '.dotfiles/linux/dotfile_path_config.sh'

source_files

nvm install node &

cargo install starship --locked &
pids+=( $! )

wait
