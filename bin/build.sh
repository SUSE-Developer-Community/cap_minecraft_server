#!/bin/bash

curl "http://www.mc-download.com/index.php?action=downloadfile&filename=Minecraft%20server%201.12.2.jar&directory=Minecraft%20Versions%20Official/Minecraft%20Server" -o server.jar
zip -ur server.jar customizations/*


