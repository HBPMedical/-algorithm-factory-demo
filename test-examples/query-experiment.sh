#!/bin/bash

VERBOSITY=$@

: ${VERBOSITY:=-pBhb}

http "$VERBOSITY" --verify=no -a admin:WoKeN --timeout 180 --json POST woken:8087/mining/experiment \
         user:='{"code":"user1"}' \
         variables:='[{"code":"cognitive_task2"}]' \
         grouping:='[]' \
         covariables:='[{"code":"score_test1"}, {"code":"college_math"}]' \
         targetTable='sample_data' \
         algorithms:='[{"code":"knn", "name": "knn", "parameters": []}]' \
         validations:='[{"code":"kfold", "name": "kfold", "parameters": [{"code": "k", "value": "2"}]}]'
