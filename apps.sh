brew install \
  neovim/neovim/neovim \
  bash-completion \
  nvm \
  python3 \
  gnupg

brew tap homebrew/completions
brew tap caskroom/versions

brew cask install \
  google-chrome \
  lastpass \
  phoenix \
  iterm2-beta \
  spotify

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

curl -sSL https://get.rvm.io | bash -s stable --ruby

