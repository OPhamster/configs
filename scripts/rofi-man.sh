#!/usr/bin/env bash

DESCRIPTION="Search for executable by their name or functionality (picked from it's corresponding \"whatis\" output)"
echo -en "\0message\x1f$DESCRIPTION\n"
show_manpage() {
    # ref: man rofi-script
    coproc ( kitty --detach man $@ >/dev/null 2>&1 )
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
