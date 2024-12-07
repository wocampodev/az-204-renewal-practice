#!/bin/bash

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

. ${script_dir}/.env

az group create \
    --name $RESOURCE_GROUP \
    --location $LOCATION
