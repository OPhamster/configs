fzfhistory() {
    h=$(history | tr -s " " | cut -d " " -f 3- | sort -u | uniq | fzf)
    echo $h
    eval $h
}
zle -N fzfhistory

type -p fzf > /dev/null
if [[ $? -eq 0 ]]; then
    bindkey -M emacs '^R' fzfhistory
fi
