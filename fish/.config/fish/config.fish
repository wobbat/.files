if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_color_error normal
set fish_color_command green
set fish_greeting
set GOPATH $HOME/.go

set -Ux EDITOR nvim

switch (uname)
case Linux
    #echo Hi Tux!
    fish_add_path $HOME/.cargo/bin
case Darwin
    eval (/opt/homebrew/bin/brew shellenv)
    fish_add_path $HOME/go/bin
case '*'
    #echo Hi, stranger!
end

alias spc="aspell -no-backup -c"
alias cl="clear"
alias gofmt="goimports"
#alias xt3='exiftool -Model="RICOH GR III" -UniqueCameraModel="RICOH GR III" -T -ext dng .'
#alias 3tx='exiftool -Model="RICOH GR IIIx" -UniqueCameraModel="RICOH GR IIIx" -T -ext dng .'
alias vim="nvim"
alias n="nvim"
alias backlight="sudo light -s sysfs/backlight/intel_backlight -S"

function nv
    if test (count $argv) -eq 0
        # No arguments, open the current directory (.) in Neovim
        nvim .
    else
        # Arguments provided, open the given file or directory in Neovim
        nvim $argv
    end
end



#ls replacement with exa
alias la="eza -a --group-directories-first"
alias lal="eza -la --group-directories-first"
alias lsl="eza -l --group-directories-first"
alias ls="eza --group-directories-first"
#alias tm="tmux ls && read tmux_session && tmux attach -t ${tmux_session:-default} || tmux new -s ${tmux_session:-default}"
alias tm="tmux new -As0"
alias tmc="tmux new -Ascode"

starship init fish | source
zoxide init fish | source
fish_vi_key_bindings

if test (basename (tty)) = "tty1"
    if not pgrep Xorg > /dev/null
        echo "Starting X server on TTY1..."
        exec startx
    else
        echo "X server is already running."
    end
end
