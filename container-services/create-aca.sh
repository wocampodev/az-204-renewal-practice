#!/bin/bash

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

. ${script_dir}/.env

az containerapp env create \
    --name $ACA_ENV \
    --resource-group $RESOURCE_GROUP \
    --location $LOCATION

az containerapp create \
    --name $ACA \
    --resource-group $RESOURCE_GROUP \
    --environment $ACA_ENV \
    --image mcr.microsoft.com/azuredocs/containerapps-helloworld:latest \
    --target-port 80 \
    --ingress 'external' \
    --query properties.configuration.ingress.fqdn
