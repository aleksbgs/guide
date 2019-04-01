#!/bin/bash

set -e

cd ${TRAVIS_BUILD_DIR}/doc

for file in $(find -type f); do
  curl --ftp-create-dirs -s -S \
    -T "$file" \
    -u "${FTP_USER}:${FTP_PASSWORD}" \
    "ftp://${FTP_HOST}/public_html/guide/$1/${file}"
done
