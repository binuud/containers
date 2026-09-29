## add autocomplete for bash file

function _makefile_targets {
    local curr_arg targets
    targets=""
    if [[ -e "$(pwd)/Makefile" ]]; then
        targets=$(grep -oE '^[a-zA-Z0-9_-]+:' Makefile | sed 's/://' | tr '\n' ' ')
    elif [[ -e "$(pwd)/makefile" ]]; then
        targets=$(grep -oE '^[a-zA-Z0-9_-]+:' makefile | sed 's/://' | tr '\n' ' ')
    fi
    curr_arg=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "${targets}" -- "$curr_arg") )
}
complete -F _makefile_targets make