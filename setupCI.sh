#!/bin/bash

# Assumptions:  
# 1) Concourse Server has been setup
# 2) Fly client has been installed
branch=$(git symbolic-ref --short HEAD)

target=$1

echo ""
echo "Setup ${branch}}_CI on target: ${target}"
echo "========================================"
fly -t ${target} set-pipeline -p ${branch}_CI -c ci/pipeline.yml -l credentials.yml

echo ""
echo "Setup ${branch}_Gated on target: ${target}"
echo "========================================"
fly -t ${target} set-pipeline -p ${branch}_Gated -c ci/pipeline.yml -l credentials.yml
