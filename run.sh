#!/bin/bash

docker run \
    --rm \
    -d \
    -e NONAME_HOST_MAX_CHAR_NUM=20 \
    -e NONAME_HOST_ALLOW_FREE_CHOOSE=true \
    -v ~/.config/NonameSha:/home/user/.config/无名杀 \
    -v ./identity.js:/home/user/resources/app/mode/identity.js \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY \
    -e XMODIFIERS \
    -e GTK_IM_MODULE \
    -e QT_IM_MODULE \
    -e AUDIO_GID="$(getent group audio | cut -d: -f3)" \
    -e VIDEO_GID="$(getent group video | cut -d: -f3)" \
    -e GID="$(id -g)" \
    -e UID="$(id -u)" \
    --userns keep-id\
    --ipc host \
    -e HTTP_PROXY="" \
    -e HTTPS_PROXY="" \
    -e AUDIO_GID="$(getent group audio | cut -d: -f3)" \
    -e VIDEO_GID="$(getent group video | cut -d: -f3)" \
    --net host \
    -v /dev/shm:/dev/shm \
    --device /dev/dri\
    -v /run/user/$(id -u)/pulse:/run/user/$(id -u)/pulse \
    -v /etc/localtime:/etc/localtime:ro \
    -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
    -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
    "naturalselect/nonameshapod:v1.10.4"
