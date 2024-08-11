#  fzf
__fzf_history__() {
    h=$(history | tr -s " " | cut -d " " -f 3- | sort -u | uniq | fzf )
    echo $h
    eval $h
}

type -p fzf > /dev/null
if [[ $? -eq 0 ]]; then
    bind -m emacs-standard -x '"\C-r": __fzf_history__'
fi
# zsh like autocomplete
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
