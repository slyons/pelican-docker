#!/bin/bash

# This will run before the pelican build, useful for installing 
# extra packages within the Docker environment

if [[ -z "${RUN_PIP}" ]]; then
    pip install -r requirements.txt
fi