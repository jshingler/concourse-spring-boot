#!/bin/sh

set -e # fail fast
set -x # print commands
export TERM=${TERM:-dumb}

# echo "Build and Publish to Maven Repo"
# echo "1=$1"
# echo "2=$2"
env

curl -u "${username}:${password}" -H "Content-Type: application/json" -X POST -d '{"title": "'"${branch}"'", "body": "Gated Pull Request from CI", "head": "'"${branch}"'", "base": "'"${target}"'"}' -i "${uri}/pulls"

echo "=============================="
echo "Issued Pull request from ${branch} to ${target}"
