#!/bin/bash
# Set oc_env voor pipelines
export SECRET_NAME=github-m10-secret
export SERVICE_ACCOUNT=github-m10-sa
export GIT_HOST=https://github.com
export NS=fuse-pipelines
export WS_SRC=fuse-sources
export PVC_SRC=$NS-$WS_SRC
export WS_MVN=maven-settings
export CM_MVN=maven-settings
