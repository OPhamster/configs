# batcat
type -p batcat > /dev/null
if [[ $? -eq 0 ]]; then
    export MANPAGER="sh -c 'col -bx | batcat -l man -p --theme Coldark-Dark'"
    alias cat=batcat
fi
