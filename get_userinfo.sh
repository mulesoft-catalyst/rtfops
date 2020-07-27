#!/usr/bin/env bash

# get userinfo

# set environment variables
[[ -f ./env ]] && source ./env

ENDPOINT="https://anypoint.mulesoft.com/accounts/api/v2/oauth2/userinfo"

curl -Lks ${ENDPOINT} \
    -H "Authorization: Bearer ${TOKEN}" \
    | jq
