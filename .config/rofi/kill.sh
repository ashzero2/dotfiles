#!/bin/bash

if [ "$@" ]
then
	pid=$(printf "%d" $(echo -e "$@" | cut -d ":" -f 1))
	echo "$pid"
	pkill "$pid"
else
	ps -U $UID --no-headers -o "%p: %c"
fi
