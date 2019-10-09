#!/usr/bin/env bash

# set environment variables
if [[ -f ../env ]]; then
    source ../env
fi

# specify app deployment id
DEPLOYMENT_ID=""

ENDPOINT="https://anypoint.mulesoft.com/hybrid/api/v2/organizations/${ORG_ID}/environments/${ENV_ID}/deployments/${DEPLOYMENT_ID}/specs"

# get app's deployment spec
curl -Lks ${ENDPOINT} \
    -H "Authorization: Bearer ${TOKEN}" \
    | jq
