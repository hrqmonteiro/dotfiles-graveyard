# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/hrq/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
export PATH="$HOME/.local/bin:$PATH"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source "$HOME/.cargo/env"

. "$HOME/.asdf/asdf.sh"

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

#if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#    tmux attach -t default || tmux new -s default
#fi

alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias ls="exa --color=always --group-directories-first --icons"
alias ll="exa -l --color=always --group-directories-first --icons"
alias la="exa -la --color=always --group-directories-first --icons"
alias lt="exa -aT --color=always --group-directories-first --icons"
alias nvm="fnm"
alias vi="nvim"
alias vim="nvim"

# fnm
export PATH="/home/hrq/.local/share/fnm:$PATH"
eval "`fnm env`"

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# Added by Amplify CLI binary installer
export PATH="$HOME/.amplify/bin:$PATH"
