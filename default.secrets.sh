#!/bin/bash

export GCP_PROJECT=""
export GCP_AUTH_KIND="serviceaccount"
export GCP_SERVICE_ACCOUNT_FILE="$PWD/credentials.json"

# Important: DO NOT set this with an unprefixed name as it messes up
# the Ansible authorization.
export INSTANCE_GCP_SERVICE_ACCOUNT_EMAIL=""

export GITLAB_RUNNER_REGISTRATION_TOKEN=""
