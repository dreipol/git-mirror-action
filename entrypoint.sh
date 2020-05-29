#!/bin/sh -l
set -eu

# Setup ssh
mkdir ~/.ssh
echo "$SSH_PRIVATE_KEY" > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa

# Setup git
export GIT_SSH_COMMAND="ssh -v -i ~/.ssh/id_rsa -l $INPUT_USER"

# Mirror it!
git remote add mirror "$INPUT_REPO"
git push mirror HEAD:"$INPUT_TARGET_BRANCH"
