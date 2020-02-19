#!/bin/bash

curl "https://cdn.getbukkit.org/spigot/spigot-1.12.2.jar" -o server.jar
zip -jur server.jar customizations/*


