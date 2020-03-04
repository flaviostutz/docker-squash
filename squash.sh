#!/bin/sh

set -e

if [ "$SOURCE_IMAGE_ID" == "" ] || [ "$TARGET_IMAGE_ID" == "" ]; then
    echo "Usage: docker run -v /var/run/docker.sock:/var/run/docker.sock -e SOURCE_IMAGE_ID=[image id] -e TARGET_IMAGE_ID=[image id] flaviostutz/docker-squash"
    exit 1
fi

# echo "Squashing image $SOURCE_IMAGE_ID..."
# docker save $SOURCE_IMAGE_ID -o /tmp/original.tar
# docker-squash -from root -t $TARGET_IMAGE_ID -verbose -i /tmp/original.tar -o /tmp/squashed.tar

# echo "Loading squashed image into $TARGET_IMAGE_ID..."
# docker image load --input /tmp/squashed.tar
# rm -rf /tmp/*

docker-squash -t $TARGET_IMAGE_ID -v $SOURCE_IMAGE_ID

