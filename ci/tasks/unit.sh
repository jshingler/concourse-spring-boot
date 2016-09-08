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
# Run Test on unrebased branch
# if success
# Rebase Origin Master on this branch and rerun test (Build Acceptance)
# if success
# Ready to submit pull request
git status
git config --global core.mergeoptions --no-edit
git config --global user.email "CI@concourse.ci"
git config --global user.name "Concourse.CI"
git remote -v
# git merge origin/master
git pull --rebase origin master
echo "Passed Gate On: $(date)\n" >> README.md

# git help
git add README.md
git commit -m "Dated README"
git clone . ../source-code2
# git push
echo "=============================="
git status

echo "Build and Publish -- Done"