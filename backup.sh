#! /bin/sh

set -e

if [ "${MC_HOST_SOURCE}" == "**None**" ]; then
  echo "Error: You did not set the MC_HOST_SOURCE environment variable."
  exit 1
fi

if [ "${MC_HOST_DESTINATION}" == "**None**" ]; then
  echo "Error: You did not set the MC_HOST_SOURCE environment variable."
  exit 1
fi

mirror_s3 () {
  SOURCE_STORAGE=$1
  DESTINATION_STORAGE=$2

  echo "Mirroring buckets from ${SOURCE_STORAGE} to ${DESTINATION_STORAGE}..."

  ./mc --insecure mirror SOURCE DESTINATION

  if [ $? != 0 ]; then
    >&2 echo "Error in migarating files from ${SOURCE_STORAGE} to ${DESTINATION_STORAGE}!"
  fi

}
 
mirror_s3 $MC_HOST_SOURCE $MC_HOST_DESTINATION
