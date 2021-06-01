#!/usr/bin/env bash

# set environment variables
[[ -f ../env ]] && source ../env

# specify app deployment id
# DEPLOYMENT_ID=${DEPLOYMENT:-DEFAULTVALUE}

ENDPOINT="https://${BASE_URL}/hybrid/api/v2/organizations/${ORG_ID}/environments/${ENV_ID}/deployments/${DEPLOYMENT_ID}/specs"

# get app's deployment spec
curl -Lks ${ENDPOINT} \
    -H "Authorization: Bearer ${TOKEN}" \
    | jq
