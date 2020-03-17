#!/bin/bash
set -Eeuo pipefail
#set -Eeuxo pipefail


### Download the runner ###
# Create a folder
mkdir actions-runner && cd actions-runner
# Download the latest runner package
curl -O -L https://github.com/actions/runner/releases/download/v2.165.2/actions-runner-linux-x64-2.165.2.tar.gz
# Extract the installer
tar xzf ./actions-runner-linux-x64-2.165.2.tar.gz