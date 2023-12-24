#  fzf
__fzf_history__() {
    eval $(history | fzf | tr -s " " | cut -d " " -f 3-)
}

type -p fzf > /dev/null
if [[ $? -eq 0 ]]; then
    bind -m emacs-standard -x '"\C-r": __fzf_history__'
fi
