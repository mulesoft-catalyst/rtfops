#!/usr/bin/env bash

ENDPOINT="https://anypoint.mulesoft.com/accounts/login"

# read username from stdin
read -p "Enter username: " USERNAME

# -s do not echo input
read -s -p "Enter password: " PASSWORD

printf "\n"

# get the access token
TOKEN=$(curl -s -d "username=${USERNAME}&password=${PASSWORD}" ${ENDPOINT} | jq -r '.access_token')

# echo doesn't handle new line well - git commit
printf "Bearer token: $TOKEN \n"

# export only works in this sub-shell and its children
# export TOKEN
