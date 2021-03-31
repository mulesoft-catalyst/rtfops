#!/usr/bin/env bash

# rename a RTF cluster in runtime manager

if [[ $# -ne 1 ]]; then
    printf "Usage: $0 <New RTF cluster name> \n"
    printf "Example: $0 1.8.50 \n"
    exit -1
fi

NEW_NAME=$1

# set environment variables
[[ -f ../env ]] && source ../env

ENDPOINT="https://anypoint.mulesoft.com/runtimefabric/api/organizations/${ORG_ID}/fabrics/${FABRIC_ID}"

# printf "${ENDPOINT} \n"

curl -Lvk ${ENDPOINT} \
    -X PATCH \
    -H "Authorization: Bearer ${TOKEN}" \
    -H "Content-Type: application/json" \
    -d '{"name": "'"$NEW_NAME"'"}' \
    | jq
