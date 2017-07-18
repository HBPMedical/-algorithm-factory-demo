#!/bin/sh

# Get clone the submodules
git submodule update --init

# Download the images
docker-compose pull