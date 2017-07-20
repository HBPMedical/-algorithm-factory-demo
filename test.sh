#!/bin/bash

exit_trap () {
  local lc="$BASH_COMMAND" rc=$?
  echo "A test has failed. Please verify that you followed all installation steps correctly." 1>&2
}

trap exit_trap EXIT
set -e

echo "Woken Test 1: Get data"
output=$(docker-compose run --rm tester -h --timeout 180 POST woken:8087/mining/job \
                                 variables:='[]' \
                                 grouping:='[]' \
                                 covariables:='[{"code":"\"cognitive_task2\""},{"code":"\"score_test1\""}]' \
                                 filters:='""' \
                                 algorithm:='{"code":"data", "name": "data", "parameters": []}')

response=$( echo "$output"  | head -n 1)
[[ "$response" == *"OK"* ]] && echo "Successful!" || { echo "Failed test 1" 1>&2 ; exit 1; }

echo "Woken Test 2: Get list of methods"

output=$(docker-compose run --rm tester -h --timeout 180 GET woken:8087/mining/list-methods)
response=$( echo "$output"  | head -n 1)
[[ "$response" == *"OK"* ]] && echo "Successful!" || { echo "Failed test 2" 1>&2 ; exit 1; }

echo "Woken Test 3: Run a simple algorithm"

output=$(docker-compose run --rm tester -h --timeout 180 POST woken:8087/mining/job \
                                      variables:='[{"code":"cognitive_task2"}]' \
                                      grouping:='[]' \
                                      covariables:='[{"code":"score_math_course1"}]' \
                                      filters:='""' \
                                      algorithm:='{"code":"knn", "name": "KNN", "parameters": [{"code": "k", "value": "2"}]}')
response=$( echo "$output"  | head -n 1)
[[ "$response" == *"OK"* ]] && echo "Successful!" || { echo "Failed test 3" 1>&2 ; exit 1; }

echo "Woken Test 4: Run a simple experiment"

output=$(docker-compose run --rm tester -h --timeout 180 POST woken:8087/mining/experiment \
                                               variables:='[{"code":"cognitive_task2"}]' \
                                               grouping:='[]' \
                                               covariables:='[{"code":"score_test1"}, {"code":"college_math"}]' \
                                               filters:='""' \
                                               algorithms:='[{"code":"knn", "name": "knn", "parameters": [{"code": "k", "value": "2"}]}]' \
                                               validations:='[{"code":"kfold", "name": "kfold", "parameters": [{"code": "k", "value": "2"}]}]')
response=$( echo "$output"  | head -n 1)
[[ "$response" == *"OK"* ]] && echo "Successful!" || { echo "Failed test 3" 1>&2 ; exit 1; }

echo "Everything seems to work just fine! Congrats!"
