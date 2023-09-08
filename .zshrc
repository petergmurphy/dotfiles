# This is your .zshrc configuration file.
# You can customize your Zsh shell behavior and settings here.

# Set the path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set the Zsh theme to load. Change "robbyrussell" to your preferred theme.
ZSH_THEME="robbyrussell"

# Define the list of themes to pick from when loading at random.
# Uncomment and customize if you want to use random themes.
# ZSH_THEME_RANDOM_CANDIDATES=("robbyrussell" "agnoster")

# Uncomment the following lines for specific behavior customization:

# CASE_SENSITIVE="true"                 # Enable case-sensitive completion.
# HYPHEN_INSENSITIVE="true"             # Enable hyphen-insensitive completion.

# Choose the auto-update behavior:
# zstyle ':omz:update' mode disabled   # Disable automatic updates.
# zstyle ':omz:update' mode auto       # Update automatically without asking.
# zstyle ':omz:update' mode reminder   # Remind to update when it's time.
# zstyle ':omz:update' frequency 13    # Set update frequency in days.

# Uncomment to disable URL and text pasting magic functions.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment to disable colors in 'ls' command output.
# DISABLE_LS_COLORS="true"

# Uncomment to disable automatic terminal title setting.
# DISABLE_AUTO_TITLE="true"

# Uncomment to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment to customize the completion waiting indicator.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# COMPLETION_WAITING_DOTS="true"

# Uncomment to disable marking untracked files as dirty in VCS.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment to customize the command execution time stamp format in history.
# HIST_STAMPS="mm/dd/yyyy" or "dd.mm.yyyy" or "yyyy-mm-dd", or custom using strftime format.

# Uncomment and set to use a custom folder for ZSH_CUSTOM.
# ZSH_CUSTOM="/path/to/new-custom-folder"

# Define which plugins to load. Customize this list according to your needs.
# Standard plugins are in $ZSH/plugins/, custom plugins in $ZSH_CUSTOM/plugins/.
plugins=(git vi-mode)

# Source oh-my-zsh script to initialize it.
source $ZSH/oh-my-zsh.sh

# User configuration below this line.

# Define aliases and custom configurations here:

# Change the 'vim' alias to use 'nvim'.
alias vim="nvim"

# Create an alias to edit your .zshrc file.
alias zshconfig="vim ~/.zshrc"

# Initialize 'starship' prompt for Zsh.
eval "$(starship init zsh)"

# Download 'Znap' if it's not already installed.
[[ -r ~/Repos/znap/znap.zsh ]] || git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git ~/Repos/znap
source ~/Repos/znap/znap.zsh  # Start Znap

# Export NVM_DIR and load nvm if it's available.
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Add /opt/homebrew/opt/openjdk@17/bin to the PATH.
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

# Set up automatic node version change based on .nvmrc files in directories.
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Source 'zsh-autosuggestions' if available.
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Define aliases for common 'ls' commands.
alias ls='exa'   # Simplified 'ls'.
alias l='exa -lbF --git'  # List with type icons and git status.
alias ll='exa -lbGF --git'  # Long list with type icons and git status.
alias llm='exa -lbGd --git --sort=modified'  # Long list sorted by modification date.
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # All list with details.
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale'  # Extended all list.

