#!/bin/sh

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
for i in `cat ~/.dotfiles/brew.list`; do brew install $i; done;
# install oh-my-zsh/cleanup/power9k/sdkman/ct
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
curl -s "https://get.sdkman.io" | bash
curl https://sh.rustup.rs -sSf | sh

cat <<EOF > /usr/local/bin/cleanup.sh
#!/bin/bash
brew update
brew upgrade
brew cleanup -s
brew cask cleanup
gem update --no-ri --no-rdoc
gem cleanup
pod repo update
#now diagnostic
brew doctor
brew missing
echo "Update Mac App Store items with: mas upgrade"
mas upgrade
EOF

echo "You need to 'manually' install software"
echo "Cask list contains : "
cat ~/.dotfiles/cask.list
echo "Other items like Docker, Keybase"

echo "Need to import GPG key from keybase"