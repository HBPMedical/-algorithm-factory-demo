#!/bin/bash

VERBOSITY=$@

: ${VERBOSITY:=-pBhb}

http "$VERBOSITY" --verify=no -a admin:WoKeN --timeout 180 --json POST woken:8087/mining/job \
         user:='{"code":"user1"}' \
         variables:='[{"code":"cognitive_task2"}]' \
         grouping:='[]' \
         covariables:='[{"code":"score_math_course1"}]' \
         targetTable='sample_data' \
         algorithm:='{"code":"knn", "name": "KNN", "parameters": [{"code": "k", "value": "2"}]}'
