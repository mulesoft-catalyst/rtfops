#!/usr/bin/env bash

# OLD_ENDPOINT="https://${BASE_URL}/runtimefabric/api/installer/package/latest"

# all metadata for rtf-agent, installer, scripts and rtfctl
ENDPOINT="https://${BASE_URL}/runtimefabric/api/downloads"
S3_BASE_URL="https://runtime-fabric.s3.amazonaws.com"

printf "downloading metadata..."

curl -Lks -H "Authorization: Bearer $TOKEN" ${ENDPOINT} | jq

printf "\n"

VERSION=$(curl -Lks -H "Authorization: Bearer $TOKEN" ${ENDPOINT} | jq -r '.installer.version')

# assemble the installer url
INSTALLER_URL="${S3_BASE_URL}/installer/runtime-fabric-${VERSION}.tar.gz"

printf "Latest Anypoint Runtime Fabric installer: \e[96m$INSTALLER_URL \n"
