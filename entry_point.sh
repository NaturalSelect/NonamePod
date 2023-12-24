#!/bin/bash

if [ -n "${NONAME_HOST_MAX_CHAR_NUM}" ]
then
    sed -i "2s/.*/const MaxCharNum = ${NONAME_HOST_MAX_CHAR_NUM};/" ./resources/app/mode/identity.js
fi

if [ -n "${NONAME_HOST_ALLOW_FREE_CHOOSE}" ]
then
    sed -i "3s/.*/const AllowFreeChoose = ${NONAME_HOST_ALLOW_FREE_CHOOSE};/" ./resources/app/mode/identity.js
fi

./Noname