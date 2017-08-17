#!/bin/bash

VERBOSITY=$@

: ${VERBOSITY:=-pBhb}

http "$VERBOSITY" --timeout 180 --json GET woken:8087/mining/list-methods
