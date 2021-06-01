#!/usr/bin/env bash

# stop a started app

# set environment variables
[[ -f ../env ]] &&  source ../env

echo $DEPLOYMENT_ID

ENDPOINT="https://${BASE_URL}/hybrid/api/v2/organizations/${ORG_ID}/environments/${ENV_ID}/deployments/${DEPLOYMENT_ID}"

curl -Lks ${ENDPOINT} \
    -X PATCH \
    -H "Authorization: Bearer ${TOKEN}" \
    -H "X-ANYPNT-ENV-ID: $ENV_ID" \
    -H "X-ANYPNT-ORG-ID: $ORG_ID" \
    -H "Content-Type: application/json" \
    -d '{"application":{"desiredState":"STOPPED"}}' \
    | jq
