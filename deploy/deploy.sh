#! /bin/bash

# deploy app to rtf cluster
# asset needs to exist in exchange

# set environment variables
if [[ -f ./env ]]; then
    source ./env
fi

ENDPOINT="https://anypoint.mulesoft.com/hybrid/api/v2/organizations/${ORG_ID}/environments/${ENV_ID}/deployments"


curl -Lvk -X POST ${ENDPOINT} \
    -H "Authorization: Bearer $TOKEN" \
    -H "X-ANYPNT-ENV-ID: $ENV_ID" \
    -H "X-ANYPNT-ORG-ID: $ORG_ID" \
    -H "Content-Type: application/json" \
    -d @body.json \
    | jq
