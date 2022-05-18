#!/usr/bin/env bash

ENDPOINT="https://anypoint.mulesoft.com/accounts/api/v2/oauth2/token"

# read username from stdin
read -p "Enter ID: " USERNAME

# -s do not echo input
read -s -p "Enter Secret: " PASSWORD

printf "\n"

# set default values using parameter expansion
# hit enter twice to save time
# USERNAME=${USERNAME:-mule}
# PASSWORD=${PASSWORD:-max}

# get the access token
JSON_STRING=$( jq -n \
                  --arg un "$USERNAME" \
                  --arg pw "$PASSWORD" \
				  '{ grant_type: "client_credentials", client_id: $un, client_secret: $pw }' )
TOKEN=$(curl -s --location --request POST ${ENDPOINT} --header 'Content-Type: application/json' --data-raw "${JSON_STRING}" | jq -r '.access_token')

# echo doesn't handle new line well - git commit
printf "Bearer token: $TOKEN \n"

# export only works in this sub-shell and its children
# export TOKEN
