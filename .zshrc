setopt autocd # Auto cd when you type in a directory name
setopt autopushd pushdignoredups # Enable pushd
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match
setopt ignore_eof # Stop quitting when I accidentally press ctrl-d

# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**'
zstyle :compinstall filename '/Users/nihaldayal/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall


# Variables
export EDITOR=vim
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=/usr/local/bin/vim:$PATH
export PATH="$PATH:/usr/local/opt/ansible@2.9/bin"
export PATH="/usr/local/opt/python3/libexec/bin:$PATH"

# Source in extra config
[ -f $HOME/.aliases ] && source $HOME/.aliases
[ -f $HOME/.workrc ] && source $HOME/.workrc
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# Run Starship
eval "$(starship init zsh)"

# FZF config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'

