#!/bin/bash
set -Eeuo pipefail
#set -Eeuxo pipefail

# Add non-root user non-interactively if not present
# Use the --gecos option to skip the chfn interactive part.
id -u doactuser &>/dev/null || adduser --disabled-password --gecos "" doactuser

# Create folder 
mkdir -p ~/doact
cd ~/doact

# create a script for non-root user
cat << 'EOF' > ./script.sh
#!/bin/bash
set -Eeuo pipefail
#set -Eeuxo pipefail

# Create a registration token using Github REST API v3
temp=$(curl -XPOST \
-H "Accept: application/vnd.github.v3+json" \
-H "authorization: Bearer ${GITHUB_ACCESS_TOKEN}" \
"https://api.github.com/repos/${GITHUB_USERNAME}/${GITHUB_REPO_NAME}/actions/runners/registration-token")

# Extract token value from the response
REGISTRATION_TOKEN=$(echo $temp | grep "token" | awk '{print $3}'| awk -F , '{print $1 }' | sed 's/"//g')

# Create a folder
mkdir actions-runner && cd actions-runner
# Download the latest runner package
curl -O -L https://github.com/actions/runner/releases/download/v2.263.0/actions-runner-linux-x64-2.263.0.tar.gz
# Extract the installer
tar xzf ./actions-runner-linux-x64-2.263.0.tar.gz

# Configure the runner
./config.sh --url https://github.com/${GITHUB_USERNAME}/${GITHUB_REPO_NAME} --token $REGISTRATION_TOKEN <<< $'\n\n' 
EOF

# give permission to user to access /root
setfacl -Rm u:doactuser:rwx /root
# add the execute permission
chmod +x ./script.sh

# run script.sh with non-root user
su doactuser ./script.sh

# clean up files with sensitive data
rm script.sh

# Install runner service as Root and start the runner service
cd actions-runner
./svc.sh install
./svc.sh start