#!/bin/bash

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

. ${script_dir}/.env

az container create \
    --resource-group $RESOURCE_GROUP \
    --name $ACI \
    --image mcr.microsoft.com/azuredocs/aci-helloworld \
    --ports 80 \
    --os-type Linux \
    --cpu 2 --memory 3.5 \
    --dns-name-label $DNS_NAME_LABEL \
    --restart-policy OnFailure \
    --environment-variables 'NumWords'='5' 'MinLength'='8' \
    --location $LOCATION

fqdn=$(
    az container show \
    --name $ACI \
    --resource-group $RESOURCE_GROUP \
    --query ipAddress.fqdn \
    -o tsv
)

echo "Url: http://$fqdn"
