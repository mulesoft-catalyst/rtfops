#! /bin/bash

# Set as environment variable
# TOKEN=""

INSTALLER_URL=$(curl -Lks -H "Authorization: Bearer $TOKEN" https://anypoint.mulesoft.com/runtimefabric/api/installer/package/latest | jq -r '.url')

echo $INSTALLER_URL
