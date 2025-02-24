# This file is equvilent to adding to the .profile, .bashrc, or .bash_profile

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/functions.sh"

add_to_path_env "$HOME/.nushell"
add_to_path_env "/opt/nvim-linux64/bin"
add_to_path_env "$HOME/.dotfiles/shell-scripts/global_scripts"
add_to_path_env "$HOME/development/flutter/bin"

# Aliases
alias pretty_path_var="echo \"${PATH//:/$'\n'}\""
