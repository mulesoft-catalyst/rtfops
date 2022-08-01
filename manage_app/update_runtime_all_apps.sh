#!/usr/bin/env bash

# set environment variables
[[ -f ../env ]] &&  source ../env

function get_deployment_ids () {
	# Get deployments IDs in specified env
	ENDPOINT="https://anypoint.mulesoft.com/hybrid/api/v2/organizations/${ORG_ID}/environments/${ENV_ID}/deployments"
	local list=$(curl -Lks ${ENDPOINT} -H "Authorization: Bearer ${TOKEN}" -H "Cache-Control: no-cache" | jq '.items | .[] | .id')
	read -a appIdArray <<< $list
}

function get_deployment_info () {
	# Get apps deployment specs
	ENDPOINT="https://anypoint.mulesoft.com/hybrid/api/v2/organizations/${ORG_ID}/environments/${ENV_ID}/deployments/${DEPLOYMENT_ID}/specs"
	#version=$(curl -Lks ${ENDPOINT} -H "Authorization: Bearer ${TOKEN}" | jq '.[0] | .target.deploymentSettings.runtimeVersion')
	json=$(curl -Lks ${ENDPOINT} -H "Authorization: Bearer ${TOKEN}")
	artifactId=$(echo $json | jq '.[0] | .application.ref.artifactId')
	eval artifactId=$artifactId
	runtimeVersion=$(echo $json | jq '.[0] | .target.deploymentSettings.runtimeVersion')
	eval runtimeVersion=$runtimeVersion
	desiredState=$(echo $json | jq '.[0] | .application.desiredState')
	eval desiredState=$desiredState
}

function modify_runtime_version () {
	ENDPOINT="https://anypoint.mulesoft.com/hybrid/api/v2/organizations/${ORG_ID}/environments/${ENV_ID}/deployments/${DEPLOYMENT_ID}"
	curl -Lks ${ENDPOINT} \
    	-X PATCH \
    	-H "Authorization: Bearer ${TOKEN}" \
    	-H "X-ANYPNT-ENV-ID: $ENV_ID" \
    	-H "X-ANYPNT-ORG-ID: $ORG_ID" \
    	-H "Content-Type: application/json" \
    	-d '{"target": {"deploymentSettings": {"runtimeVersion": "'"$baseVersion"'"}},"application": {"desiredState": "'"$desiredState"'"}}' \
    	| jq '.status'
	}

get_deployment_ids
for i in "${appIdArray[@]}"
do
   eval i=$i
   echo $i
   DEPLOYMENT_ID=$i
   get_deployment_info
   echo "App name: $artifactId"
   echo "Actual version:  $runtimeVersion"
   baseVersion=$(echo $runtimeVersion | cut -d ':' -f 1)
   echo "Base runtime version: $baseVersion"
   echo "App desiredState: $desiredState"
   #echo '{"target": {"deploymentSettings": {"runtimeVersion": "'"$baseVersion"'"}},"application": {"desiredState": "'"$desiredState"'"}}'
   modify_runtime_version
done
