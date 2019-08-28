#! /bin/bash

# Set as environment variable
# TOKEN=""

INSTALL_SCRIPTS_URL=$(curl -Lks -H "Authorization: Bearer $TOKEN" https://anypoint.mulesoft.com/runtimefabric/api/installer/scripts/latest | jq -r '.url')

printf "$INSTALL_SCRIPTS_URL \n"
