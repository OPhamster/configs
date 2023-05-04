#!/usr/bin/env bash

DESCRIPTION="Search for executable by their name or functionality (picked from it's corresponding \"whatis\" output)"
# echo "export MAN_TERM=<preferred_terminal>" >> ~/.profile

echo -en "\0message\x1f$DESCRIPTION\n"

exec_with_term() {
    # NOTE: `coproc` is suggested in `man rofi-script`
    # NOTE: The exit is there to make the terminal window a single use window
    case $MAN_TERM in
        kitty) coproc ( kitty --title "man $@" --detach man $@ && exit >/dev/null 2>&1 )
               ;;
        urxvt) coproc ( urxvt -T "man $@" -e man $@ && exit >/dev/null 2>&1 )
               ;;
        konsole) coproc ( konsole -e man $@ && exit >/dev/null 2>&1 )
                 ;;
        xterm) coproc ( xterm -T "man $@" -e man $@ && exit >/dev/null 2>&1 )
               ;;
        *) rofi-sensible-terminal $@
           ;;
    esac
}

show_manpage() {
    exec_with_term $@
}

list_manpages() {
    # this gives u the list of executables
    whatis -s 1,8 -r .
}

strip_selection() {
    # * needs to start with alphanumeric characters
    # * can have hyphen(-) or underscore(_) in executable name
    # * needs to be followed by a man section surrounded by paranthesis like `([0-9]+)`
    # NOTE: There are certain executables that have (seemingly legitimate) sections that are not just
    # numbers but alphanumeric in nature. For example `c_rehash (1ssl)`. In those cases we're basically
    # attempting to fetch the first section of the manpage. The manpage with section directive still works
    # with this as expected i.e `man c_rehash(1ssl)` gives the same results as `man c_rehash` but
    # something to note.
    echo $@ | grep -E '^(([[:alnum:]])+([-_][[:alnum:]]+)* (\([0-9]+\))*)' -o | sed -E s/\ //
}

if [ $# == 0 ]; then
    list_manpages
else
    show_manpage $(strip_selection $1)
fi
