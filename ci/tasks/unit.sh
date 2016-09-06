#!/bin/sh

set -e # fail fast
set -x # print commands

export TERM=${TERM:-dumb}

echo "Build and Publish to Maven Repo"
echo "1=$1"
echo "2=$2"
env

pwd
cd source-code
pwd
git status
date >> README.md
echo "=============================="
git status

echo "Build and Publish -- Done"