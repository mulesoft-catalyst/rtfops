#! /bin/bash

# list rtf clusters registered under the org

# set environment variables
if [ -f ./env ]; then
    source ./env
fi

ENDPOINT="https://anypoint.mulesoft.com/runtimefabric/api/organizations/${ORG_ID}/fabrics"

curl -Lks ${ENDPOINT} \
    -H "Authorization: Bearer $TOKEN" |
    jq

#curl -Lvk \
#    -H "Authorization: Bearer $TOKEN" \
#    https:/anypoint.mulesoft.com/hybrid/api/v2/organizations/${ORG_ID}/environments/${ENV_ID}/deployments
#    \ | jq
