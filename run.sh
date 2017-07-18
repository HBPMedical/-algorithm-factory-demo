#!/usr/bin/env bash

set -e

get_script_dir () {
     SOURCE="${BASH_SOURCE[0]}"

     while [ -h "$SOURCE" ]; do
          DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
          SOURCE="$( readlink "$SOURCE" )"
          [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
     done
     cd -P "$( dirname "$SOURCE" )"
     pwd
}

cd "$(get_script_dir)"

if [ $NO_SUDO ]; then
  DOCKER="docker"
  DOCKER_COMPOSE="docker-compose"
elif groups $USER | grep &>/dev/null '\bdocker\b'; then
  DOCKER="docker"
  DOCKER_COMPOSE="docker-compose"
else
  DOCKER="sudo docker"
  DOCKER_COMPOSE="sudo docker-compose"
fi

echo "Remove old running containers (if any)..."
$DOCKER_COMPOSE kill
$DOCKER_COMPOSE rm -f

network_bridge_name="algo-demo-bridge"

if [ $($DOCKER network ls | grep -c $network_bridge_name) -lt 1 ]; then
  echo "Create $network_bridge_name network..."
  $DOCKER network $network_bridge_name
else
  echo "Found $network_bridge_name network !"
fi

echo "Deploy a Postgres instance and wait for it to be ready..."
$DOCKER_COMPOSE up -d db
$DOCKER_COMPOSE run wait_dbs

echo "Create databases..."
$DOCKER_COMPOSE run create_dbs

echo "Migrate metadata database..."
$DOCKER_COMPOSE run meta_db_setup

echo "Migrate features database..."
#$DOCKER_COMPOSE run sample_db_setup

echo "Run containers..."
$DOCKER_COMPOSE up -d zookeeper mesos_master mesos_slave chronos woken woken_validation backend frontend

echo "DONE"
