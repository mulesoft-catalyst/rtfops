#!/usr/bin/env bash

# rename a RTF cluster in runtime manager

# set environment variables
[[ -f ../env ]] && source ../env

ENDPOINT="https://anypoint.mulesoft.com/runtimefabric/api/organizations/${ORG_ID}/fabrics/${DEPLOYMENT_ID}"

printf "${ENDPOINT} \n"

curl -Lvk ${ENDPOINT} \
    -X PATCH \
    -H "Authorization: Bearer ${TOKEN}" \
    -H "Content-Type: application/json" \
    -d '{"name": "rtf-cluster-reborn"}' \
    | jq
