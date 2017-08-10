#!/bin/bash

VERBOSITY=$1

: ${VERBOSITY:--v}

http "$VERBOSITY" --timeout 180 POST woken:8087/mining/job \
         variables:='[]' \
         grouping:='[]' \
         covariables:='[{"code":"\"cognitive_task2\""},{"code":"\"score_test1\""}]' \
         filters:='""' \
         algorithm:='{"code":"data", "name": "data", "parameters": []}'
