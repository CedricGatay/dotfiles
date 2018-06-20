# Source:
# http://stackoverflow.com/questions/171563/whats-in-your-zshrc
# http://zsh.sourceforge.net/Doc/Release/index-frame.html
# https://github.com/nono/dotfiles
# https://github.com/ryanb/dotfiles
# Ubuntu: /etc/zsh/newuser.zshrc.recommended
#set -x
source ~/.zsh/config.common
HOST=$(hostname -s)
# we source host specific config
if [ -f ~/.zsh/config.${HOST} ]; then
  source ~/.zsh/config.${HOST};
fi
source ~/.zsh/completion
source ~/.zsh/aliases.common
# we source host specific aliases
if [ -f ~/.zsh/aliases.${HOST} ]; then
  source ~/.zsh/aliases.${HOST};
fi