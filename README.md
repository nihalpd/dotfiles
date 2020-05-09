# dotfiles
Instructions for future self:

## Initial setup

```console
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.zsrc
```


## Adding submodules

```console
nihal@thinkpad: config submodule add https://github.com/vim-airline/vim-airline.git .vim/pack/default/start/vim-airline
nihal@thinkpad: config commit
```
