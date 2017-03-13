# Woken DEMO

This project helps you to quickly deploy a Mesos stack locally and install a demo instance of the Algorithm Factory.
It can then be used to test and validate newly integrated algorithms.

## Pre-requisite

1) Install a fairly recent version of docker (official documentation)
2) Install docker-compose (official documentation)
3) Configure any firewall to allow the download of images from Docker hub (https://hub.docker.com)

## How to run everything

1) Simply run the script run.sh
> ./run.sh

This script simply launch all the required services specified in the docker-compose config file.

It if the first time you run this command, it can takes some time as it has to download all the docker images from docker hub.

It will setup a complete containerized Mesos stack. Whereas it very practical for debugging purpose, it is not advised to use such settings for Mesos in a production environment.

## How to test your own algorithm

1) Create a docker image for your algorithm by following the steps described here

2) Run script test/test_algorithm.sh

...