#!/bin/bash

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

. ${script_dir}/.env

redis_instance=$(az redis show -g $RESOURCE_GROUP -n $REDIS -o json)
redis_keys=$(az redis list-keys -g $RESOURCE_GROUP -n $REDIS -o json)

hostname=$(echo $redis_instance | jq -r '.hostName')
ssl_port=$(echo $redis_instance | jq -r '.sslPort')
primary_key=$(echo $redis_keys | jq -r '.primaryKey')

REDIS_CONNECTION_STRING="$hostname:$ssl_port,password=$primary_key,ssl=True,abortConnect=False"
export REDIS_CONNECTION_STRING

dotnet run
