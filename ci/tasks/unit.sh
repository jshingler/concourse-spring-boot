#!/bin/sh

set -e # fail fast
set -x # print commands

export TERM=${TERM:-dumb}

echo "Build and Publish to Maven Repo"
echo "1=$1"
echo "2=$2"
echo "3=$3"

pwd
cd source-code
pwd
date >> README.md
echo "=============================="
git status

echo "Build and Publish -- Done"