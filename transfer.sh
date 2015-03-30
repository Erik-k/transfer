#!/bin/sh
# Wrapper for running the octave script transfer.m
# On Windows, use Cygwin64 to access Octave and the packages.

# Check for octave, octave-symbolic, octave-controls
hash octave 2>/dev/null || { echo >&2 "Need octave but it's not installed.  Aborting."; exit 1; }

mytest=$(octave -q --eval "pkg list" | grep -q control)
if [ $? -ne 0 ]; then #try to install
	echo "attempting to install octave-control"
    octave -q --eval "pkg install -verbose -forge control"
    if [ $? -ne 0 ]; then
        echo "I do not find octave-control. I was unable to install automatically."
        echo "please ensure you have the following installed:"
        echo "make gfortran g++ libhdf5-devel liblapack-devel libopenblas"
        [[ $(uname -o) -eq Cygwin ]] && echo "gcc-fortran gcc-g++"
	    echo >&2 "octave-control package is not installed! Aborting."
	    exit 1
	fi
fi

mytest=$(octave -q --eval "pkg list" | grep -q symbolic)
if [ $? -ne 0 ]; then
	echo "attempting to install octave-symbolic"
    octave -q --eval "pkg install -verbose -forge symbolic"
    if [ $? -ne 0 ]; then
    echo "I was not able to auto-install octave-symbolic."
	echo >&2 " octave-symbolic package is not installed! Aborting."
	exit 1
    fi
fi

echo "Hit <enter> in the terminal to exit."
octave -q --persist transfer.m
