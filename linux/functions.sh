# $1 = path_to_src_dir (or file)
# $2 = path_to_dest_dir
# Check if the directory specified by $2 exists,
# if it does move it to .backup and create a soft
# link from $2 to $1
backup_and_create_ln() {
    local base_name=$(basename $1)
    local r1=$(bash -c 'echo $RANDOM')
    local r2=$(bash -c 'echo $RANDOM')
    # Attempt move, if it fails then the dir/file didn't exist
    mv "$2/$base_name" "$HOME/.dotfiles/.backup"
    if [[ $? != 0 ]] ;
    then
        echo "Directory/File already exists here \`$2/$base_name\` (moving old version to $HOME/.dotfiles/.backup)"
        mv "../.backup/$base_name" "../.backup/$r1$r2$base_name"
    fi
    ln -s $1 $2
}

# Checks if the provided directory exists and if it is already defined
# on the path, if these checks pass it will be added to the PATH
# $1 = path_to_directory (the root dir is $HOME)
add_to_path_env() {
    if [ -d "$1" ] ;
    then
        if [[ "$1" == *"$PATH"* ]];
        then
            echo "Dir already defined on the path: $1"
        else
            export PATH="$1:$PATH"
        fi
    else
        echo "Dir does not exist: $1"
    fi
}

# $1 = path_to_script (the root dir is $HOME)
add_script_if_not_exist() {
    # Check if file exists
    if [ -f "$HOME/$1" ] ; then
        local script_path=". \"\$HOME/$1\""
        # Check for .profiles files, add script path when/if one is found
        if [ -f "$HOME/.bashrc" ] ;
        then
            if grep -Fxq -e "$script_path" "$HOME/.bashrc" ;
            then
                echo "Script already added to .bashrc: $1"
            else
                echo $script_path >> "$HOME/.bashrc"
                source "$HOME/.bashrc"
            fi
        elif [ -f "$HOME/.bash_profile"] ;
        then
            if grep -Fxq -e "$script_path" "$HOME/.bash_profile" ;
            then
                echo "Script already added to .bash_profile: $1"
            else
                echo $script_path >> "$HOME/.bash_profile"
                source "$HOME/.bash_profile"
            fi
        elif [ -f "$HOME/.profile" ] ;
        then
            if grep -Fxq -e "$script_path" "$HOME/.profile" ;
            then
                echo "Script already added to .profile: $1"
            else
                echo $script_path >> "$HOME/.profile"
                source "$HOME/.profile"
            fi
	
        else
            echo "Could not find .profile, .bash_profile, or .bashrc"
        fi
    else
        echo "File does not exist: $HOME/$1"
    fi
}

# executes source on .profile .bash_profile and .bashrc
source_files() {
    # Check for .profiles files, add script path when/if one is found
    if [ -f "$HOME/.profile" ] ;
    then
        source "$HOME/.profile"
    fi

    if [ -f "$HOME/.bash_profile" ] ;
    then
        source "$HOME/.bash_profile"
    fi

    if [ -f "$HOME/.bashrc" ] ;
    then
        source "$HOME/.bashrc"
    fi
}
