# This file is equvilent to adding to the .profile, .bashrc, or .bash_profile

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/functions.sh"

add_to_path_env ".nushell"

# Aliases
alias pretty_path_var="echo \"${PATH//:/$'\n'}\""