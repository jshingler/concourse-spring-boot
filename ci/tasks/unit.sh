Skip to content
This repository
Search
Pull requests
Issues
Gist
 @jshingler
 Unwatch 1
  Star 0
 Fork 0 jshingler/concourse-spring-boot
 Code  Issues 1  Pull requests 0  Projects 1  Wiki  Pulse  Graphs  Settings
Branch: feature1 Find file Copy pathconcourse-spring-boot/ci/tasks/unit.sh
948882e  22 hours ago
@jshingler jshingler added rebase test
1 contributor
RawBlameHistory     Executable File  41 lines (32 sloc)  918 Bytes
#!/bin/sh

set -e # fail fast
set -x # print commands
export TERM=${TERM:-dumb}
# echo "Build and Publish to Maven Repo"
# echo "1=$1"
# echo "2=$2"
# env

cd source-code
echo "Configuring Git"
git status
git config --global core.mergeoptions --no-edit
git config --global user.email "CI@concourse.ci"
git config --global user.name "Concourse.CI"
# git remote -v

# Run Test on unrebased branch
./gradlew test

# Rebase Origin Master on this branch and rerun test (Build Acceptance)
# git merge origin/master
echo "Rebase master into branch"
git pull --rebase origin master

echo "Run Tests on rebase code"
# Run Test on unrebased branch
./gradlew test
echo "Passed Gate On: $(date)\n" >> README.md

# git help
git add README.md
git commit -m "Dated README"

# Copy to output areas so it can be pushed back up to repo
git clone . ../source-code2

echo "=============================="
echo "Build and Publish -- Done"
Contact GitHub API Training Shop Blog About
© 2016 GitHub, Inc. Terms Privacy Security Status Help