# dotfiles

Everything here was taken from the following two articles:
https://www.atlassian.com/git/tutorials/dotfiles
https://shapeshed.com/vim-packages/

## Initial setup

```zsh
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.zsrc
```


## Adding dotfiles

```zsh
config status
config add .vimrc
config commit -m "Add vimrc"
config add .zshrc
config commit -m "Add zshrc"
config push
```

## Adding submodules

```zsh
config submodule add https://github.com/vim-airline/vim-airline.git .vim/pack/default/start/vim-airline
config commit
```
