#!/usr/bin/env bash

[[ -f ../env ]] && source ../env

ENDPOINT="https://${BASE_URL}/runtimefabric/api/organizations/${ORG_ID}/fabrics/${FABRIC_ID}/logforwarding"

# Get logfowarding status
curl -Lks ${ENDPOINT} \
    -H "Authorization: Bearer ${TOKEN}" \
    | jq
