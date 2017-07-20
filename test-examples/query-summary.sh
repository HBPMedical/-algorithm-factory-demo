#!/bin/bash

http -v --timeout 180 POST woken:8087/mining/job \
         variables:='[{"code":"stress_before_test1"}]' \
         grouping:='[]' \
         covariables:='[{"code":"score_test1"}]' \
         filters:='""' \
         algorithm:='{"code":"statisticsSummary", "name": "Statistics Summary", "parameters": []}'
