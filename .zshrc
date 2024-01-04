# prompt stuff
setprompt() {
setopt prompt_subst

PROMPT='%T %~
%F{red}%\:%F{green}%\:%F{yellow}%\:%F{blue}%\:%F{magenta}%\:%f '

PROMPT='%T %~
%F{red}%\|%F{green}%\|%F{yellow}%\|%F{blue}%\|%F{cyan}%\|%f '

PROMPT='%T %~
%F{red}%\:%F{green}%\:%F{yellow}%\:%F{magenta}%\:%F{blue}%\:%f '

}

setprompt

alias pkm="cd ~/pkm; hx ."
alias spc="aspell -no-backup -c"
alias cl="clear"
alias gofmt="goimports"
alias xt3='exiftool -Model="RICOH GR III" -UniqueCameraModel="RICOH GR III" -T -ext dng .'
alias 3tx='exiftool -Model="RICOH GR IIIx" -UniqueCameraModel="RICOH GR IIIx" -T -ext dng .'
alias vim="nvim"
alias n="nvim"
alias kssh="kitten ssh"
alias dailynote="date '+%d-%m-%Y.md' | awk '{print "~/_/log/daily/"$1}"

#ls replacement with exa
alias la="eza -a --group-directories-first"
alias lal="eza -la --group-directories-first"
alias lsl="eza -l --group-directories-first"
alias ls="eza --group-directories-first"
alias tm="tmux ls && read tmux_session && tmux attach -t ${tmux_session:-default} || tmux new -s ${tmux_session:-default}"

alias zij="zellij"
setopt complete_aliases

path+=('/opt/homebrew/opt/python@3.9/libexec/bin')
path+=('/Users/stan/.nimble/bin')
path+=('/Users/stan/go/bin')
path+=('/Users/stan/.zig')
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

bindkey ";5C" forward-word
bindkey ";5D" backward-word
bindkey "^[[3~" delete-char

eval $(opam env)

# bun
export BUN_INSTALL="$HOME/Library/Application Support/reflex/bun"
export PATH="$BUN_INSTALL/bin:$PATH"
