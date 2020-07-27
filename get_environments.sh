#!/usr/bin/env bash

# get environments

# set environment variables
[[ -f ./env ]] && source ./env

ENDPOINT="https://anypoint.mulesoft.com/accounts/api/organizations/${ORG_ID}/environments"

curl -Lks ${ENDPOINT} \
    -H "Authorization: Bearer ${TOKEN}" \
    | jq
