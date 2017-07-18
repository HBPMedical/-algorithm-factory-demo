#!/bin/bash

exit_trap () {
  local lc="$BASH_COMMAND" rc=$?
  echo "A test has failed. Please verify that you followed all installation steps correctly." 1>&2
}

trap exit_trap EXIT
set -e

echo "Woken Test 1: Get data"
docker-compose run --rm test -v --timeout 180 POST woken:8087/mining/dob \
                                 variables:='[]' \
                                 grouping:='[]' \
                                 covariables:='[{"code":"\"cognitive_task2\""},{"code":"\"score_test1\""}]' \
                                 filters:='[]' \
                                 algorithm:='{"code":"data", "name": "data", "parameters": []}'

test=$( !!  | grep HTTP/  | cut -d ' ' -f 2 )
echo $test;
exit 0;
[ ${ $(!!) | grep HTTP/  | cut -d ' ' -f 2 } -eq 0 ]

exit 1;

echo "Woken Test 2: Get list of methods"

docker-compose run --rm test -v --timeout 180 GET woken:8087/mining/list-methods

[ $? -eq 0 ] && echo "Successful" || { echo "Failed test 1" 1>&2 ; exit 1; }

echo "Woken Test 3: Run a simple algorithm"

docker-compose run --rm test -v --timeout 180 POST woken:8087/mining/job \
                                      variables:='[{"code":"cognitive_task2"}]' \
                                      grouping:='[]' \
                                      covariables:='[{"code":"score_math_course1"}]' \
                                      filters:='[]' \
                                      algorithm:='{"code":"knn", "name": "KNN", "parameters": []}'

[ $? -eq 0 ] && echo "Successful" || { echo "Failed test 1" 1>&2 ; exit 1; }

echo "Everything seems to work just fine! Congrats!"
