#
# ~/.bashrc
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return
source /usr/share/fzf/fzf_opts.bash
source -- ~/.local/share/blesh/ble.sh
eval "$(starship init bash)"
ble-import -d integration/fzf-completion
ble-import -d integration/fzf-key-bindings
ble-bind -s dsr0 ''

# alias ls='ls --color=auto'
alias ls='exa --icons always'
#alias open='evince'
alias preview='evince -w'
alias view='imv'
alias grep='grep --color=auto'
alias vpn_csie='sudo openvpn --config ~/vpn/csie2025.ovpn --daemon'
alias vpn_ctf='sudo openvpn --config ~/vpn/edu-ctf.ovpn --daemon'
alias vpn_nasa='sudo openvpn --config ~/vpn/26NASA_OpenVPN.ovpn --daemon'
alias vpn_htb='sudo openvpn --config ~/vpn/starting_points_us-starting-point-2-dhcp.ovpn --daemon'
alias vpn_htb2='sudo openvpn --config ~/vpn/machines_sg-1.ovpn --daemon'
alias vpn_stop='sudo killall openvpn'
alias ssh='kitty +kitten ssh'
alias penv='source ~/cspyenv/bin/activate'
alias cat='bat -p'
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org/"

fcd(){
    local 
    local dir
    # Search for directories using fd, pipe to fzf with your tree preview
    dir=$(fd --type=d --hidden --exclude .git --search-path ~ | fzf --preview 'exa --tree --color=always {} | head -200')
  
    # Only change directories if a selection was actually made
    if [[ -n "$dir" ]]; then
        cd "$dir"
    fi
}
open(){
    evince "$@" >/dev/null 2>&1 &
    disown
}
gc(){
    gcc -o ${1%.*} $1
}
gpp(){
    g++ -o ${1%.*} $1
}
tcc(){
    local pdf=".pdf"
    typst compile $1 ${1%.*}$pdf
}

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# Added by Antigravity CLI installer
export PATH="/home/Qwertypig/.local/bin:$PATH"
export PATH="/home/Qwertypig/.local/bin:$PATH"
