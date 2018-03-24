#!/bin/bash

# This script demonstrates the bug.

# First, ensure that we're in a clean slate.
rm -rf .stack-work

# Now, try to open the test suite:
stack repl stack-test-bug:test:test

if [[ $? == 0 ]]; then
    echo
    echo Looks like the bug is fixed!
    exit
fi

# Just opening the library works.
stack repl --ghci-options "-e :quit"

if [[ $? == 0 ]]; then
    echo
    echo Running stack repl worked OK there.
    echo
fi

# If we do a build, then it works.
stack build

stack repl stack-test-bug:test:test --ghci-options "-e :quit"

if [[ $? == 0 ]]; then
    echo
    echo The initial build is required for the test, but not ordinary stack ghci!
    echo
fi

