#!/bin/bash

if [ -n "${NONAME_HOST_MINI_CHAR_NUM}" ]
then
    sed -i "2s/.*/const minCharNum = ${NONAME_HOST_MINI_CHAR_NUM};/" ./resources/app/mode/identity.js
fi

./Noname