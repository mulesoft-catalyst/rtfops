#! /bin/bash

# get the list of mule runtime image base versions and tags

# set environment variables
if [ -f ./env ]; then
    source ./env
fi

ENDPOINT="https://anypoint.mulesoft.com/runtimefabric/api/organizations/${ORG_ID}/targets"

curl -Lks ${ENDPOINT} \
    -H "Authorization: Bearer $TOKEN" \
    | jq
