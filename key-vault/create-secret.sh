#!/bin/bash

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

. ${script_dir}/.env

az keyvault secret set --vault-name $VAULT --name $SECRET_NAME --value $RANDOM
