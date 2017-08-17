#!/bin/bash

VERBOSITY=$@

: ${VERBOSITY:--v}

echo http "$VERBOSITY" --timeout 180 POST woken:8087/mining/job variables:='[{"code":"cognitive_task2"}]' grouping:='[]' covariables:='[{"code":"score_test1"}]' filters:='""' algorithm:='{"code":"linearRegression", "name": "linearRegression", "parameters": []}'

http "$VERBOSITY" --timeout 180 POST woken:8087/mining/job \
         variables:='[{"code":"cognitive_task2"}]' \
         grouping:='[]' \
         covariables:='[{"code":"score_test1"}]' \
         filters:='""' \
         algorithm:='{"code":"linearRegression", "name": "linearRegression", "parameters": []}'
