#!/bin/bash

if [ -z "$2" ]
  then
    echo "Usage: create_ios_app_icons.sh source_image destination_directory"
    exit 1
fi

SOURCE_IMAGE=$1
DESTINATION_DIR=$2
IMAGE_NAME=${SOURCE_IMAGE%.png}
IMAGE_NAME=${IMAGE_NAME##*/}


IMAGE_WIDTH=$(sips -g pixelWidth $SOURCE_IMAGE | cut -s -d ':' -f 2 | cut -c 2-)
IMAGE_HEIGHT=$(sips -g pixelHeight $SOURCE_IMAGE | cut -s -d ':' -f 2 | cut -c 2-)


ONE_X_IMAGE_WIDTH=$(expr $IMAGE_WIDTH / 3)
ONE_X_IMAGE_HEIGHT=$(expr $IMAGE_HEIGHT / 3)

sips -z $ONE_X_IMAGE_HEIGHT $ONE_X_IMAGE_WIDTH $SOURCE_IMAGE --out "$DESTINATION_DIR/$IMAGE_NAME.png"

TWO_X_IMAGE_WIDTH=$(expr $(expr $IMAGE_WIDTH \* 2) / 3)
TWO_X_IMAGE_HEIGHT=$(expr $(expr $IMAGE_HEIGHT \* 2) / 3)

sips -z $TWO_X_IMAGE_HEIGHT $TWO_X_IMAGE_WIDTH $SOURCE_IMAGE --out "$DESTINATION_DIR/$IMAGE_NAME@2x.png"

sips -z $IMAGE_HEIGHT $IMAGE_WIDTH $SOURCE_IMAGE --out "$DESTINATION_DIR/$IMAGE_NAME@3x.png"
