#! /bin/sh

# exit if a command fails
set -e

apk update

#install minio mc 
apk add wget
wget https://dl.min.io/client/mc/release/linux-amd64/mc
chmod +x mc
apk del wget

# install go-cron
apk add curl
curl -L --insecure https://github.com/odise/go-cron/releases/download/v0.0.6/go-cron-linux.gz | zcat > /usr/local/bin/go-cron
chmod u+x /usr/local/bin/go-cron
apk del curl

# cleanup
rm -rf /var/cache/apk/*
