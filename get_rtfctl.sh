#!/usr/bin/env bash

# set environment variables
source ./env

# all metadata for rtf-agent, installer, scripts and rtfctl
ENDPOINT="https://anypoint.mulesoft.com/runtimefabric/api/downloads"
BASE_URL="https://runtime-fabric.s3.amazonaws.com"

VERSION=$(curl -Lks -H "Authorization: Bearer $TOKEN" ${ENDPOINT} | jq -r '.rtfctl.version')

# assemble the installer url
INSTALLER_URL="${BASE_URL}/rtfctl/rtfctl-${VERSION}"

echo $INSTALLER_URL
