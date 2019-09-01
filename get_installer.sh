#! /bin/bash

# Set as environment variable
source env

# OLD_ENDPOINT="https://anypoint.mulesoft.com/runtimefabric/api/installer/package/latest"

# all metadata for rtf-agent, installer, scripts and rtfctl
ENDPOINT="https://anypoint.mulesoft.com/runtimefabric/api/downloads"
BASE_URL="https://runtime-fabric.s3.amazonaws.com"

printf "all download metadata..."

curl -Lks -H "Authorization: Bearer $TOKEN" ${ENDPOINT} | jq

printf "\n"

VERSION=$(curl -Lks -H "Authorization: Bearer $TOKEN" ${ENDPOINT} | jq -r '.installer.version')

# assemble the installer url
INSTALLER_URL="${BASE_URL}/installer/runtime-fabric-${VERSION}.tar.gz"

printf "Latest Anypoint Runtime Fabric installer: \e[96m$INSTALLER_URL \n"
