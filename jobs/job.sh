#!/bin/bash
module load nextflow Singularity;

if [[ -z $1 ]];
then 
    echo "No JSON passed."
else
    JSON=$1
    variants=$(nextflow run annotation.nf -profile annotation --json $JSON)
    echo $variants | jq length

    TOKEN=$(curl --location --request POST 'https://keycloak.ccmdev.ca/auth/realms/ssmpdev/protocol/openid-connect/token' --header 'Content-Type: application/x-www-form-urlencoded' --data-urlencode 'password=secret' --data-urlencode 'username=ssmp-user' --data-urlencode 'client_id=ssmp-server' --data-urlencode 'realm=ssmpdev' --data-urlencode 'grant_type=password' | jq -r '.access_token')
    curl --request POST \
        -H 'Content-Type: application/json' \
        --header "Authorization: Bearer $TOKEN" \
        --data "{'operationName':'OnSlurmResponse','variables':{ 'jobId': $SLURM_JOB_ID, 'variants': $variants}}" \
        https://osmp.ccmdev.ca/graphql
fi

