#!/usr/bin/env bash

JAVA_VERSIONS=("1.8.0" "11")

[ -z "$AWS_ACCESS_KEY_ID" ] &&
        echo "AWS_ACCESS_KEY_ID environment variable not set" &&
        exit 1
[ -z "$AWS_SECRET_ACCESS_KEY" ] &&
        echo "AWS_SECRET_ACCESS_KEY environment variable not set" &&
        exit 1

for VERSION in ${JAVA_VERSIONS[@]}
  do
    packer build \
    -var aws_access_key="$AWS_ACCESS_KEY_ID" \
    -var aws_secret_key="$AWS_SECRET_ACCESS_KEY" \
    -var java_version="$VERSION" \
    build.json
done