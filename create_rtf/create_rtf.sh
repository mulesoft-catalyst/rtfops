#!/usr/bin/env bash

# create a new RTF cluster via REST API
# get activation data for automation

# set environment variables
if [[ -f ./env ]]; then
    source ./env
fi

ENDPOINT="https://anypoint.mulesoft.com/runtimefabric/api/organizations/${ORG_ID}/fabrics"

printf "${ENDPOINT} \n"

curl -Lvk -X POST \
    ${ENDPOINT} \
    -H "Authorization: Bearer ${TOKEN}" \
    -H "Content-Type: application/json" \
    -d @rtf.json \
    | jq
