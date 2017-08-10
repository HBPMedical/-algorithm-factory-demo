#!/bin/bash

VERBOSITY=$1

: ${VERBOSITY:--v}

http "$VERBOSITY" --timeout 180 POST woken:8087/mining/experiment \
         variables:='[{"code":"cognitive_task2"}]' \
         grouping:='[]' \
         covariables:='[{"code":"score_test1"}, {"code":"college_math"}]' \
         filters:='""' \
         algorithms:='[{"code":"knn", "name": "knn", "parameters": []}]' \
         validations:='[{"code":"kfold", "name": "kfold", "parameters": [{"code": "k", "value": "2"}]}]'
