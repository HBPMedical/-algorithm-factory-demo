#!/bin/sh

[ -x /usr/local/bin/pre-commit ] && pre-commit install

# Download the images
docker-compose pull
