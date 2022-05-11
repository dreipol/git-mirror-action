#!/bin/sh -l
set -eu

# Setup ssh
mkdir ~/.ssh
echo "$SSH_PRIVATE_KEY" > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa

# Setup git
export GIT_SSH_COMMAND="ssh -v -i ~/.ssh/id_rsa -l $INPUT_USER"

# Mirror it!
git config --global lfs.allowincompletepush true
git config --global --add safe.directory /github/workspace
git remote add mirror "$INPUT_REPO"
git fetch mirror
git push mirror --force HEAD:"$INPUT_TARGET_BRANCH"
