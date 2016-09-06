#!/bin/sh

set -e # fail fast
set -x # print commands

export TERM=${TERM:-dumb}

echo "Build and Publish to Maven Repo"
pwd
cd source-code
pwd
date >> README.md

echo "Build and Publish -- Done"