
# NVM loadinng
autoload -Uz compinit
compinit -i

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/etc/bash_completion.d/nvm" ] && . "$NVM_DIR/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Starship loading
eval "$(starship init zsh)"

# Thefuck loading
eval $(thefuck --alias)

# Zsh plugin 
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=180"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Fasd loading
eval "$(fasd --init auto)"

# Env Var 
export PATH=~/.local/bin:$PATH

# Kubectl autocompletion
source <(kubectl completion zsh)

# Github token for Hr-apps release
export GITHUB_TOKEN=e53688695103da1870842fdae0236bf0340a5cfc

# Print todo list
tb

# opam configuration
test -r /Users/kevinlemele/.opam/opam-init/init.zsh && . /Users/kevinlemele/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#Alias
alias v='f -e vim'
