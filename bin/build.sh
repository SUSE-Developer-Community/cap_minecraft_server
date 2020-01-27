#!/bin/bash

curl "https://launcher.mojang.com/mc/game/1.12.2/server/886945bfb2b978778c3a0288fd7fab09d315b25f/server.jar" -o server.jar
zip -jur server.jar customizations/*


