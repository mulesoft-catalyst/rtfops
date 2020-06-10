#!/usr/bin/env bash

[[ -f ../env ]] && source ../env

ENDPOINT="https://anypoint.mulesoft.com/runtimefabric/api/organizations/${ORG_ID}/fabrics/${FABRIC_ID}/logforwarding"

# Enable logfowarding for a cluster
curl -Lks ${ENDPOINT} \
    -X PATCH \
    -H "Authorization: Bearer ${TOKEN}" \
    -H "Content-Type: application/json" \
    --data-binary '{"anypointMonitoring": false}' \
    | jq
