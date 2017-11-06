#!/bin/bash

exit_trap () {
    [[ $? -eq 0 ]] || echo "A test has failed. Please verify that you followed all installation steps correctly." 1>&2
}

trap exit_trap EXIT
set -e

if [[ $NO_SUDO || -n "$CIRCLECI" ]]; then
  DOCKER_COMPOSE="docker-compose"
elif groups $USER | grep &>/dev/null '\bdocker\b'; then
  DOCKER_COMPOSE="docker-compose"
else
  DOCKER_COMPOSE="sudo docker-compose"
fi

echo "Woken Test 1: Get data"
response=$($DOCKER_COMPOSE run --rm tester ./query-data.sh -h | grep -o "HTTP.*")
[[ "$response" == *"OK"* ]] && echo "Successful!" || { echo -e "Failed test 1:\n$output" 1>&2 ; exit 1; }

echo "Woken Test 2: Get list of methods"

response=$($DOCKER_COMPOSE run --rm tester ./query-list-methods.sh -h | grep -o "HTTP.*")
[[ "$response" == *"OK"* ]] && echo "Successful!" || { echo -e "Failed test 2:\n$output" 1>&2 ; exit 1; }

echo "Woken Test 3: Run a simple algorithm"

response=$($DOCKER_COMPOSE run --rm tester ./query-knn.sh -h | grep -o "HTTP.*")
[[ "$response" == *"OK"* ]] && echo "Successful!" || { echo -e "Failed test 3:\n$output" 1>&2 ; exit 1; }

echo "Woken Test 4: Run a simple experiment"

response=$($DOCKER_COMPOSE run --rm tester ./query-experiment.sh -h | grep -o "HTTP.*")
[[ "$response" == *"OK"* ]] && echo "Successful!" || { echo -e "Failed test 4: $response\n$output" 1>&2 ; exit 1; }

echo "Everything seems to work just fine! Congrats!"
