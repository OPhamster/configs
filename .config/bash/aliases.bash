# bat

BAT=bat
# debian systems have this bin as `batcat`
type -p apt > /dev/null
if [[ $? -eq 0 ]]; then
    BAT=batcat
fi

type -p $BAT > /dev/null
if [[ $? -eq 0 ]]; then
    export MANROFFOPT="-c" MANPAGER="sh -c 'col -bx | ${BAT} -l man -p --theme Coldark-Dark'"
    alias cat='${BAT} --paging=never'
fi
