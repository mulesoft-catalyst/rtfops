#!/usr/bin/env bash

ENDPOINT="https://${BASE_URL}/accounts/login"

# read username from stdin
read -p "Enter username: " USERNAME

# -s do not echo input
read -s -p "Enter password: " PASSWORD

printf "\n"

# set default values using parameter expansion
# hit enter twice to save time
# USERNAME=${USERNAME:-mule}
# PASSWORD=${PASSWORD:-max}

# get the access token
TOKEN=$(curl -s -d "username=${USERNAME}&password=${PASSWORD}" ${ENDPOINT} | jq -r '.access_token')

# echo doesn't handle new line well - git commit
printf "Bearer token: $TOKEN \n"

# export only works in this sub-shell and its children
# export TOKEN
