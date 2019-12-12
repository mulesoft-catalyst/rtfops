#!/usr/bin/env bash

# delete a rtf cluster using fabric id

# set environment variables
if [[ -f ../env ]]; then
    source ../env
fi

ENDPOINT="https://anypoint.mulesoft.com/runtimefabric/api/organizations/${ORG_ID}/fabrics/${FABRIC_ID}"

# are you sure you want to delete ${FABRIC_ID}

curl -Lvk ${ENDPOINT} \
    -H "Authorization: Bearer ${TOKEN}" \
    | jq

read -p "Are you sure to delete the Runtime Fabric cluster? (y/n)?" CHOICE

case "$CHOICE" in
    y|Y )
        printf "Deleting fabric: ${FABRIC_ID} \n"
        curl -Lvk ${ENDPOINT} -H "Authorization: Bearer ${TOKEN}" -X DELETE
        ;;
    n|N )
        printf "\033[31m %s \n\033[0m" "DELETE aborted"
        exit 1
        ;;
    * )
        printf "\033[31m %s \n\033[0m" "invalid input"
        ;;
esac
