#!/bin/bash

if [ "$#" -eq 0 ]
then
    echo "Starting new Emacs process ..." >&2
    emacs & disown
elif emacsclient -n "$@" 2> /dev/null
then
    echo "Opened $@ in Emacs server" >&2
else
    echo "Opening $@ in a new Emacs process ..." >&2
    emacs "$@" & disown
fi
