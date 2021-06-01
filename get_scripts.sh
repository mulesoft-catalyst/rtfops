#!/usr/bin/env bash

# Set as environment variable

ENDPOINT="https://${BASE_URL}/runtimefabric/api/downloads"
BASE_URL="https://runtime-fabric.s3.amazonaws.com"

VERSION=$(curl -Lks -H "Authorization: Bearer ${TOKEN}" ${ENDPOINT} | jq -r '.scripts.version')

SCRIPTS_URL="${BASE_URL}/install-scripts/rtf-install-scripts-${VERSION}.zip"

printf "${SCRIPTS_URL} \n"
