#!/bin/bash

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

. ${script_dir}/.env

az acr create \
    --resource-group $RESOURCE_GROUP \
    --name $ACR \
    --sku Basic

az acr build \
    --image sample/hello-world:v1 \
    --registry $ACR \
    --file Dockerfile .
