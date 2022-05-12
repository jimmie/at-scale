#!/bin/bash

# This will activate conda
source /home/jovyan/.bashrc

# Runs the commands specified in the docker arguments
exec "$@"