#!/bin/bash

echo "$(pwd)"
mv chromium77-client.tar.gz ./resources/app/chromium77-client.tar.gz

pushd ./resources/app/
tar -zxf chromium77-client.tar.gz
rm chromium77-client.tar.gz
mv ./noname-chromium77-client/* ./
rm -r ./noname-chromium77-client
popd

rm ./resources/app/mode/identity.js
mv ./identity.js ./resources/app/mode/identity.js