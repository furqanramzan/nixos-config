#!/usr/bin/env bash

project_directory="nixosconfig"
repository_directory="code"

# Absolute path to project directory
project_path="$HOME/projects/$project_directory"
repository_path="$project_path/$repository_directory"
# If directory not exists
if [ ! -d "$repository_path" ]; then
    git clone git@gitlab.com:furqanpersonal/nixos-config.git $repository_path
    cd $repository_path
    nixos-rebuild build --flake .#config
    cd -
fi
exit 0
