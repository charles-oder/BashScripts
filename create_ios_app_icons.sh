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

echo "processing $IMAGE_NAME"

sips -z 20 20 $SOURCE_IMAGE --out "$DESTINATION_DIR/$IMAGE_NAME-20.png"
sips -z 40 40 $SOURCE_IMAGE --out "$DESTINATION_DIR/$IMAGE_NAME-20@2x.png"

sips -z 29 29 $SOURCE_IMAGE --out "$DESTINATION_DIR/$IMAGE_NAME-29.png"
sips -z 58 58 $SOURCE_IMAGE --out "$DESTINATION_DIR/$IMAGE_NAME-29@2x.png"

sips -z 40 40 $SOURCE_IMAGE --out "$DESTINATION_DIR/$IMAGE_NAME-40.png"
sips -z 80 80 $SOURCE_IMAGE --out "$DESTINATION_DIR/$IMAGE_NAME-40@2x.png"

sips -z 50 50 $SOURCE_IMAGE --out "$DESTINATION_DIR/$IMAGE_NAME-50.png"
sips -z 100 100 $SOURCE_IMAGE --out "$DESTINATION_DIR/$IMAGE_NAME-50@2x.png"

sips -z 72 72 $SOURCE_IMAGE --out "$DESTINATION_DIR/$IMAGE_NAME-72.png"
sips -z 144 144 $SOURCE_IMAGE --out "$DESTINATION_DIR/$IMAGE_NAME-72@2x.png"

sips -z 76 76 $SOURCE_IMAGE --out "$DESTINATION_DIR/$IMAGE_NAME-76.png"
sips -z 152 152 $SOURCE_IMAGE --out "$DESTINATION_DIR/$IMAGE_NAME-76@2x.png"

sips -z 167 167 $SOURCE_IMAGE --out "$DESTINATION_DIR/$IMAGE_NAME-83.5@2x.png"
