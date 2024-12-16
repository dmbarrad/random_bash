#!/bin/bash
# this is a script that helps to add syntax highlighiting to
# ed the standard editor. i no longer use this, since i no longer
# like to see highlighted text, raw white on black is the divine way. 
# try slewsys/ed version, that shit fire, it even has macros!
. /etc/bash_completion
_complete_function() {
    COMPREPLY=($(compgen -W "$1" -- "${COMP_WORDS[COMP_CWORD]}"))
}
complete -F _complete_function ee.sh
# TODO: add a function, that takes two argumentes, that define the filename and the filetype and then call the func in each of the cases below
function et(){
# rlwrap -r ed -Rv $1 | pygmentize -s -l $2 -f console256 
 rlwrap -r ed -R $1 | pygmentize -s -l $2 -f console
}
case "$1" in
    *.py | *.pyw | *.pyi | *.jy |*.sage |*.bzl |*.tac)et $1 python;;
    *.ps | *.eps)et $1 postscript;;
    *.sh|*.in | *.bash | *.ksh | *.bashrc | *PKGBUILD)et $1 bash;;
    *.c | *.h | *.idc | *.xm | *.xbpm)et $1 c;;
    *.pl)et $1 perl;;
    *.awk)et $1 awk;;
    *.go)et $1 go;;
    *.vim | *.vimrc | *.exrc | *.gvimrc)et $1 vim;;
    *.bc)et $1 bc;;
    *.bf | *.b)et $1 bf;;
    *.cmake | CMakeLists.txt)et $1 cmake;;
    *.cpp | *.hpp | *.c++ | *.h++ | *.cc | *.hh | *.cxx | *.hxx | *.cp | *.CPP | *.tpp)et $1 cpp;;
    *.css)et $1 css;;
    *.diff | *.patch)et $1 diff;;
    *.plot | *.plt)et $1 gnuplot;;
    *.go)et $1 golang;;
    *.[1-9] | *.man | *.1p | *.3pm | *.ms | *.mom | *.me | *.mm | *.mdoc)et $1 groff;;
    *.html | *.htm | *.xhtml | *.xslt)et $1 html;;
    *.md | *.markdown)et $1 markdown;;
    *.mak | *.mk | Makefile | makefile | Makefile.* | GNUmakefile)et $1 makefile;;
    *.asm | *.ASM | *.tasm)et $1 tasm;;
    *.tex | *.aux | *.toc)et $1 tex;;
    *.todo.txt | *.todotxt | todo.txt)et $1 todotxt;;
    *.txt)et $1 text;;
    *.wiki)et $1 wikitext;;
    *)rlwrap -r ed $1;;
esac
