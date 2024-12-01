#!/bin/bash

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

. ${script_dir}/.env

az group create --name $RESOURCE_GROUP --location $LOCATION

az keyvault create --name $VAULT --resource-group $RESOURCE_GROUP --location $LOCATION
