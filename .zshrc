# Plugins
source /home/shanksxz/.antidote/antidote.zsh
antidote load
source ~/path/to/fsh/fast-syntax-highlighting.plugin.zsh

# Environment
HISTFILE=~/.zsh_history
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:/home/shanksxz/.spicetify
export PATH=/home/shanksxz/.opencode/bin:$PATH
export PATH="$HOME/.bun/bin:$PATH"
export ENVIRONMENT=local
export EDITOR=nvim

# Ensure SSH_AUTH_SOCK is set (systemd sets it when service runs)
if [ -z "$SSH_AUTH_SOCK" ]; then
    export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
fi
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"
eval "$(mise activate zsh)"

# yazi wrapper to change directory after command execution
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# Aliases - Apps & tools
alias vim='nvim'
alias vi='nvim'
alias btop='btop --force-utf'
alias ff='fastfetch'
alias zshrc='nvim ~/.config/zsh/.zshrc'
alias znvim='z ~/.config/nvim/ && nvim .'
alias reload='source ~/.config/zsh/.zshenv && source ~/.config/zsh/.zshrc'

# Aliases - Tmux
alias t='tmux -u'
alias tmux='tmux -u'
alias tkill='tmux kill-session'
alias tls='tmux list-sessions'
alias ta='tmux attach'
alias tad='tmux attach -d'

tm() {
    if [[ $# -eq 1 ]]; then
        tmux has-session -t "$1" 2>/dev/null && tmux attach -t "$1" || tmux new -s "$1"
    else
        tmux attach 2>/dev/null || tmux new
    fi
}

tms() {
    local session
    session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&
    tmux attach-session -t "$session"
}

tms-switch() {
    if [[ -z "$TMUX" ]]; then
        echo "Not inside a tmux session. Use 'tms' to attach from outside tmux."
        return 1
    fi
    local current_session=$(tmux display-message -p '#S')
    local session
    session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null |
              grep -v "^$current_session$" |
              fzf --exit-0 --prompt="Switch to session: ") &&
    tmux switch-client -t "$session"
}
alias tmss='tms-switch'

# Aliases - Directory listing (lsd)
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias lst='lsd -lt'
alias lss='lsd -lS'
alias lse='lsd -lX'
alias lsv='lsd -lv'
alias lsg='lsd -lG'

# Aliases - Git
alias glg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

gfb() {
    local branches branch
    branches=$(git branch --all | grep -v HEAD | sed 's/remotes\/origin\///' | sed 's/^\* //' | awk '!seen[$0]++' | fzf) &&
    git checkout "$branches"
}

# Aliases - Scripts & pnpm
alias work='/home/shanksxz/code/scripts/work/fe.sh'
alias ghs='/home/shanksxz/code/scripts/gh/gh.sh'
alias vt='/home/shanksxz/code/scripts/work/run-tests.sh'
alias orgmanga='/home/shanksxz/code/scripts/manga/manga.sh'
alias goerr='/home/shanksxz/code/scripts/work/check-errors.sh'
alias prd='pnpm run dev'
alias pr='pnpm run'
alias px='pnpm dlx'

# Install packages from official repos
alias pi='pacman -Slq | fzf --multi --preview "pacman -Si {1}" | xargs -ro sudo pacman -S'
# Install from AUR
alias yi='yay -Slq | fzf --multi --preview "yay -Si {1}" | xargs -ro yay -S'
# Search both repos + AUR, then install
alias yf='yay -Slq | fzf --multi --preview "yay -Si {1}" | xargs -ro yay -S'
# Remove installed packages
alias pr='pacman -Qq | fzf --multi --preview "pacman -Qi {1}" | xargs -ro sudo pacman -Rns'
# Browse installed packages
alias ql='pacman -Qq | fzf --preview "pacman -Qil {1}"'
# Clean orphaned packages
alias yc='sudo pacman -Rns $(pacman -Qdtq)'

mkcd() {
    mkdir -p "$1" && z "$1"
}

# Suffix aliases
alias -s go="$EDITOR"
alias -s js="$EDITOR"
alias -s yaml="$EDITOR"
alias -s json="jq <"

# Keybindings
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# External config
source "$HOME/.local/bin/env"

export ANTHROPIC_BASE_URL="http://localhost:8080"
export ANTHROPIC_AUTH_TOKEN="test"

# Vite+ bin (https://viteplus.dev)
. "$HOME/.vite-plus/env"

. "$HOME/.atuin/bin/env"

# bun completions
[ -s "/home/shanksxz/.bun/_bun" ] && source "/home/shanksxz/.bun/_bun"
