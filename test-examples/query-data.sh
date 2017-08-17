#!/bin/bash

VERBOSITY=$@

: ${VERBOSITY:=-pBhb}

http "$VERBOSITY" --timeout 180 --json POST woken:8087/mining/job \
         variables:='[]' \
         grouping:='[]' \
         covariables:='[{"code":"\"cognitive_task2\""},{"code":"\"score_test1\""}]' \
         filters:='""' \
         algorithm:='{"code":"data", "name": "data", "parameters": []}'
