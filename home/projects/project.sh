code_dir="${script_dir}/code"

clone_project() {
    info "Cloning '$path'"
    if execute "git clone $url $path"; then
        success "Done cloning '$path'"
    else
        error "Error while cloning '$path'. Look ${output} for more detail."
    fi
}
clone() {
    [[ -z "${1-}" ]] && die "You must specify a repository to clone."

    url=$1
    path=$code_dir
    [[ "${2-}" ]] && path="$code_dir/$2"

    clone_project $url $path
}

install_dependencies() {
    info "Installing dependencies in '$path' use '$packagemanager'"
    execute "cd $path"
    if $packagemanager install &>>$output; then
        success "Done installing dependencies '$path'"
    else
        die "Error while installing dependencies '$path'. Look ${output} for more detail."
    fi
    execute "cd -"
}
install() {
    [[ -z "${1-}" ]] && die "You must specify a package manager."

    packagemanager=$1
    path=$code_dir
    [[ "${2-}" ]] && path="$code_dir/$2"

    install_dependencies $packagemanager $path
}

create_database() {
    info "Creating database '$database'"
    if mysql --user="$user" --password="$password" --execute="CREATE DATABASE $database;" &>>$output; then
        success "Done creating database '$database'"
    else
        error "Error while creating database '$database'. Look ${output} for more detail."
    fi
}
delete_database() {
    info "Deleting database '$database'"
    if mysql --user="$user" --password="$password" --execute="DROP DATABASE $database;" &>>$output; then
        success "Done deleting database '$database'"
    else
        error "Error while deleting database '$database'. Look ${output} for more detail."
    fi
}
database() {
    [[ -z "${1-}" ]] && die "You must specify a database name."
    [[ -z "${2-}" ]] && die "You must specify a action."

    user="root"
    password=""
    database=$1
    action=$2
    # [[ "${2-}" ]] && user=$2
    # [[ "${3-}" ]] && password=$3

    while :; do
        case "${2-}" in
        create) create_database $user $password $database ;;
        delete) delete_database $user $password $database ;;
        -?*) die "Unknown option: $2" ;;
        *) break ;;
        esac
        shift
    done
}

deinitialize_project() {
    rm -rf $code_dir
    deinitialize
}

reinitialize_project() {
    deinitialize_project
    initialize_project
}

initialize_project() {
    # if [ -d $code_dir ]; then
    #     read -p "Code directory already exists. Do you want reinitialize? " -n 1 -r
    #     echo # (optional) move to a new line
    #     if [[ $REPLY =~ ^[Yy]$ ]]; then
    #         reinitialize_project
    #     else
    #         exit 0
    #     fi
    # else
    #     initialize
    # fi
    if [ ! -d $code_dir ]; then
        initialize
    fi
}

initialize_project
