#!/usr/bin/env bash

# delete an app by deployment id

# set environment variables
if [[ -f ../env ]]; then
    source ../env
fi

# app deployment id
# DEPLOYMENT_ID=${DEPLOYMENT_ID:-DEFAULTVALUE}

ENDPOINT="https://anypoint.mulesoft.com/hybrid/api/v2/organizations/${ORG_ID}/environments/${ENV_ID}/deployments/${DEPLOYMENT_ID}"

curl -Lvk -X DELETE \
    -H "Authorization: Bearer ${TOKEN}" \
    $ENDPOINT \
    | jq
