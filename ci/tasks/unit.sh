fast
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
git add README.md
git commit -m "Dated README"
# git push
echo "=============================="
git status

echo "Build and Publish -- Done"