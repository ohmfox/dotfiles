mkdir -p ~/.config/nvim
cd ~/.config/nvim
mkdir backups swaps undo
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip3 install neovim
nvim +PlugInstall

