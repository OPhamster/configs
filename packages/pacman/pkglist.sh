#!/bin/bash

DUMP_FILE="pacman.dump"

function dump_packages {
	pacman -Qqen > $DUMP_FILE
}

function install_packages {
	if [[ -f "$DUMP_FILE" ]]; then
		sudo pacman -S - < $DUMP_FILE
	else
		echo "Provide dump file either as argument or generate a dump file first"
		help
	fi
}

function help_doc {
	echo "USAGE: ./pkglist dump [file_name]    to dump the explicitly installed packages into a dump file. file_name is pacman.dump by default"
	echo "USAGE: ./pkglist install [file_name] to install packages from the dump file. file_name is pacman.dump by default"
	echo "USAGE: ./pkglist help_doc            generate this helpd doc"
}

function choice {
	case $1 in
		dump)
			dump_packages;;
		install)
			install_packages;;
		help_doc)
			help_doc;;
		*)
			echo "Unknown command $1";
			help_doc
			exit 1;;
	esac
}

if [[ -z $1 ]]; then
	help_doc
else
	choice $1
fi

