#!/bin/bash

VERBOSITY=$@

: ${VERBOSITY:--v}

http "$VERBOSITY" --verify=no -a admin:WoKeN --timeout 180 POST woken:8087/mining/job \
         user:='{"code":"user1"}' \
         variables:='[{"code":"cognitive_task2"}]' \
         grouping:='[]' \
         covariables:='[{"code":"score_test1"}]' \
         targetTable='sample_data' \
         algorithm:='{"code":"linearRegression", "name": "linearRegression", "parameters": []}'
