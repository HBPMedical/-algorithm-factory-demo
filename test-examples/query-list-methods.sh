#!/bin/bash

VERBOSITY=$@

: ${VERBOSITY:=-pBhb}

http "$VERBOSITY" --verify=no -a admin:WoKeN --timeout 180 --json GET woken:8087/mining/methods
