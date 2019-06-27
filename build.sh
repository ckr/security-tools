#!/bin/bash

BUILD_DATE=`date +"%Y%m%d"`

echo "" > manifest.ini


for FOLDER in */
do
	FILE=${FOLDER%/}
	docker build -t $FILE:$BUILD_DATE $FILE/
	docker tag $FILE:$BUILD_DATE $FILE:latest

	echo "$FILE:latest" >> manifest.ini
done