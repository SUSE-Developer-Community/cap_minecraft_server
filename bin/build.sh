#!/bin/bash

curl "https://cdn.getbukkit.org/spigot/spigot-1.12.2.jar" -o server.jar

pushd spigot
zip -ur ../server.jar *
popd
