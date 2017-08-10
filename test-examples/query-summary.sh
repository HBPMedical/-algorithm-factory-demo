#!/bin/bash

VERBOSITY=$1

: ${VERBOSITY:--v}

http "$VERBOSITY" --timeout 180 POST woken:8087/mining/job \
         variables:='[{"code":"stress_before_test1"}]' \
         grouping:='[]' \
         covariables:='[{"code":"score_test1"}]' \
         filters:='""' \
         algorithm:='{"code":"statisticsSummary", "name": "Statistics Summary", "parameters": []}'
