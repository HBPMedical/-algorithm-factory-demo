[![CHUV](https://img.shields.io/badge/CHUV-LREN-AF4C64.svg)](https://www.unil.ch/lren/en/home.html) [![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](https://github.com/LREN-CHUV/woken-db-setup/blob/master/LICENSE) [![Codacy Badge](https://api.codacy.com/project/badge/Grade/474d2f290fb247cbaa6c220d470f05ba)](https://www.codacy.com/app/hbp-mip/algorithm-factory-demo?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=HBPMedical/algorithm-factory-demo&amp;utm_campaign=Badge_Grade) [![CircleCI](https://circleci.com/gh/HBPMedical/algorithm-factory-demo.svg?style=svg)](https://circleci.com/gh/HBPMedical/algorithm-factory-demo)

# Algorithm Factory DEMO

This project helps you to quickly deploy a complete Mesos stack locally as well as an instance of the Algorithm Factory on top of it.
It aims at providing a testing/debugging environment for the integration of new algorithms.

Note that it is not meant at all to be used in production mode.

## Pre-requisite

1. Install a fairly recent version of docker's community edition ([official documentation](https://docs.docker.com/engine/installation/))
2. Install docker-compose ([official documentation](https://docs.docker.com/compose/install/))
3. Configure any firewall to allow the download of images from Docker hub (https://hub.docker.com)
4. Add your current user to the docker group
5. Make sure that docker containers can access internet

Sometimes the containers seem not to be able to access internet. It is usually a DNS lookups problem and can be solved by configuring correctly the docker daemon.
You can find instructions and tests regarding this issue [here](https://robinwinslow.uk/2016/06/23/fix-docker-networking-dns/#the-permanent-system-wide-fix)

## Installation

1. Clone the present repository without changing the name of its root directory
2. Run the script after-git-clone.sh

> ./after-git-clone.sh

As it has to download a certain number of docker images form docker hub, it may take a little while... Do 30 push-ups...

## How to run a local instance of the Algorithm Factory

1. Execute the script run.sh

> ./run.sh

On the first run, it has to download a certain number of docker images form docker hub. For that reason it may take a little while... Do 30 push-ups...

This script will launch all the required services specified in the underlying docker-compose config file.
It will also ensure that everything is running correctly by executing a few tests

## How to integrate your own algorithm

1. Create a compliant docker image containing your algorithm
2. Add your an entry for you algorithm in woken/conf/application.conf in the section defaultSettings.request.functions using the following format

> YOUR_ALGORITHM_NAME = {
>
>   image = "YOUR_DOCKER_IMAGE_NAME:YOUR_DOCKER_IMAGE_TAG"
>
>   preditictive = true | false
>
> }

## How to create a compliant docker image

### General guidelines

Here are the general specifications that any algorithm's docker image should respect in order to be run inside the Algorithm Factory.

The image should be able to:

- Retrieve tabular data from a feature (SQL) database given a URL and a query string given as environment variables
- Run an a piece of code (the algorithm) using the retrieved data that produce a tangible output (i.e. statistics, models)
- Write the output as a PFA document in another (SQL) database whose URL is also given as an environment variable

*To be continued*

We already provide small frameworks for Java and Python environments. Those are not mandatory, they are only helpers that contributors can choose to use or not.

### Java specifics

*Coming soon*

### Python specifics

*Coming soon*
