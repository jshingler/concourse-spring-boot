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
git config --global core.mergeoptions --no-edit
git config --global user.email "CI@concourse.ci"
git config --global user.name "Concourse.CI"
git remote -v
git merge origin/master
date >> README.md

git help
git add README.md
git commit -m "Dated README"
# git push
echo "=============================="
git status

echo "Build and Publish -- Done"