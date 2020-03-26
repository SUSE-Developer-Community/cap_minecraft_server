#!/bin/bash

SPACE="minecraft"

APP_GUID=`cf app minecraftserver --guid`

cf delete-route -f cap.explore.suse.dev -n minecraftserver
cf delete-route -f cap.explore.suse.dev -n minecraftmap
cf delete-route -f minecraftserver.tcp.cap.explore.suse.dev --port 20003



cf curl /v2/apps/$APP_GUID -X PUT -d '{"ports": [8123,25565]}'


cf create-route $SPACE minecraftserver.tcp.cap.explore.suse.dev --port 20003
cf create-route $SPACE cap.explore.suse.dev -n minecraftmap

ROUTES=`cf curl /v2/routes` 
MAP_ROUTE_GUID= echo ROUTES | jq '.resources[]| select(.entity.host == "minecraftmap") | .metadata.guid'
SERVER_ROUTE_GUID= echo ROUTES | jq '.resources[]| select(.entity.port == 20003) | .metadata.guid'

cf curl /v2/route_mappings -X POST -d "{\"app_guid\": \"${APP_GUID}\", \"route_guid\": ${MAP_ROUTE_GUID}, \"app_port\": 8123}"
cf curl /v2/route_mappings -X POST -d "{\"app_guid\": \"${APP_GUID}\", \"route_guid\": ${SERVER_ROUTE_GUID}, \"app_port\": 25565}"

