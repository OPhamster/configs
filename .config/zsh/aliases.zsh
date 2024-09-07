# bat

BAT=bat
# debian systems have this bin as `batcat`
type -p apt > /dev/null
if [[ $? -eq 0 ]]; then
    alias BAT=batcat
fi

type -p $BAT > /dev/null
if [[ $? -eq 0 ]]; then
    export MANROFFOPT="-c" MANPAGER="sh -c 'col -bx | ${BAT} -l man -p --theme Coldark-Dark'"
    alias cat='${BAT} --paging=never'
    alias catp='${BAT} --paging=always'
fi

# pinfo
type -p pinfo > /dev/null
if [[ $? -eq 0 ]]; then
    alias info=pinfo
fi

# kitty integration
if [[ $TERM == "xterm-kitty" ]]; then
    alias ssh='kitten ssh'
fi

alias convert=magick

alias vim="emacsclient -c -a='' -nw"
