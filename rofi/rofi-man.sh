#!/usr/bin/env bash

show_manpage() {
    # ref: man rofi-script
    coproc ( kitty man $@ >/dev/null 2>&1 )
}

list_manpages() {
    whatis -r ".*"
}

strip_selection() {
    echo $@ | cut -d '-' -f1 | sed -E s/\ //
}

if [ $# == 0 ]; then
    list_manpages
else
    show_manpage $(strip_selection $1)
fi
