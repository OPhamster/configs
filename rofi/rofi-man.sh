#!/usr/bin/env bash

show_manpage() {
    # ref: man rofi-script
    coproc ( kitty --detach man $@ >/dev/null 2>&1 )
}

list_manpages() {
    # this gives u the list of executables
    whatis -s 1,8 -r .
}

strip_selection() {
    # TODO: fix this bug
    # BUG: what if the executable contains a `-`
    # CONSIDER: `i3-msg` would actual return `man i3`
    echo $@ | cut -d '-' -f1 | sed -E s/\ //
}

if [ $# == 0 ]; then
    list_manpages
else
    show_manpage $(strip_selection $1)
fi
