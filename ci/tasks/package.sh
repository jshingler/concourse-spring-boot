#!/bin/sh

set -e # fail fast
set -x # print commands

echo "Build and Publish to Maven Repo"
gradlew assemble publish

echo "Move artifacts to output area"
cp build/libs/concourse-spring-boot*.jar ../build

echo "Build and Publish -- Done"