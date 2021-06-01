#!/usr/bin/env bash

# update rtf agent to version specified

if [[ $# -ne 1 ]]; then
    printf "Usage: $0 <RTF Agent Version> \n"
    exit -1
fi

AGENT_VERSION=$1
# AGENT_VERSION=${1-}

# set environment variables
[[ -f ./env ]] && source ./env

ENDPOINT="https://${BASE_URL}/runtimefabric/api/organizations/${ORG_ID}/fabrics/{FABRIC_ID}"

curl -Lks ${ENDPOINT} \
    -X PATCH \
    -H "Authorization: Bearer $TOKEN" \
    -H "X-ANYPNT-ORG-ID: $ORG_ID" \
    -H "Content-Type: application/json;charset=UTF-8" \
    --data-raw '{"id":"$ORG_ID","version":"$AGENT_VERSION"}' \
    | jq
