######################################################
# 													 #
# 				    SETUP NEOVIM				     #
# 													 #
######################################################
sudo apt update
sudo apt install neovim python3-neovim software-properties-common -y
sudo apt-get install python3-dev python3-pip
pip install py2neo
npm install -g yarn

# install neovim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install all plugin
nvim --headless +PlugInstall +qa

# update clangd plugin
nvim --headless +CocCommand clangd.install +qa

# setup for c++
sudo apt update
sudo apt install ccls

# setup for airline font
mkdir -p $ROOT_PATH/fonts
git clone https://github.com/powerline/fonts.git $ROOT_PATH/fonts/powerline-fonts
$ROOT_PATH/fonts/powerline-fonts/install.sh
