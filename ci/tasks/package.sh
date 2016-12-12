#!/bin/sh

set -e # fail fast
set -x # print commands

export TERM=${TERM:-dumb}

echo "Build and Publish to Maven Repo: ${MAVEN_REPO}"
pwd
cd source-code
pwd
# JLS Temporarily disable publish to nexus
#./gradlew -PrepoUrl=${MAVEN_REPO} assemble publish
./gradlew -PrepoUrl=${MAVEN_REPO} assemble publish

echo "Move artifacts to output area"
cp build/libs/concourse-spring-boot*.jar ../build

echo "Build and Publish -- Done"