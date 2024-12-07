#!/bin/bash

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

. ${script_dir}/.env

az redis create --location $LOCATION \
    --resource-group $RESOURCE_GROUP \
    --name $REDIS \
    --sku Basic \
    --vm-size c0
