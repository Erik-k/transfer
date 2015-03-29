#!/bin/sh
# Wrapper for running the octave script transfer.m

# Check for octave, octave-symbolic, octave-controls
hash octave 2>/dev/null || { echo >&2 "Need octave but it's not installed.  Aborting."; exit 1; }

mytest=$(octave -q --eval "pkg list" | grep -q control)
if [ $? -ne 0 ]
then
	echo "octave-control package is not installed! Aborting."
	exit 1
fi

mytest=$(octave -q --eval "pkg list" | grep -q symbolic)
if [ $? -ne 0 ]
then
	echo "octave-symbolic package is not installed! Aborting."
	exit 1
fi

echo "Hit <enter> in the terminal to exit."
octave -q transfer.m