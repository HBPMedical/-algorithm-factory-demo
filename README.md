# Algorithm Factory DEMO

This project helps you to quickly deploy a complete Mesos stack locally as well as an instance of the Algorithm Factory on top of it.
It aims at providing a testing/debugging environment for the integration of new algorithms.

Note that it is not meant at all to be used in production mode.

## Pre-requisite

1. Install a fairly recent version of docker's community edition ([official documentation](https://docs.docker.com/engine/installation/))
2. Install docker-compose ([official documentation](https://docs.docker.com/compose/install/))
3. Configure any firewall to allow the download of images from Docker hub (https://hub.docker.com)
4. Add your current user to the docker group

## Installation

1. Clone the present repository without changing the name of its root directory
2. Run after-git-clone.sh script that will update the dependencies.
> ./after-git-clone.sh

As it has to download a certain number of docker images form docker hub, it may take a little while... Do 30 push-ups...

## How to start everything

1. Simply run the script run.sh
> ./run.sh

This script will simply launch all the required services specified in the underlying docker-compose config file.

## Test that everything is fine

1. Run the script test.sh
> ./test.sh

It will try to query a certain number of

## How to test your own algorithm

1) Create a docker image for your algorithm by following the steps described here

2) Add your the name of your algorithm's image in woken/conf/application.conf in the section defaultSettings.request.functions using the following format

> YOUR_ALGORITHM_NAME = {
>   image = "YOUR_DOCKER_IMAGE_NAME:YOUR_DOCKER_IMAGE_TAG"
> }

...