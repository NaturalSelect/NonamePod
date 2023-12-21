#!/bin/bash

echo "$(pwd)"
mv chromium77-client.tar.gz ./resources/app/chromium77-client.tar.gz

pushd ./resources/app/
tar -zxvf chromium77-client.tar.gz
rm chromium77-client.tar.gz
mv ./noname-chromium77-client/* ./
rm -r ./noname-chromium77-client
popd