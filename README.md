# Noname Game Pod

A docker image for [libccy/noname](https://github.com/libccy/noname/).

## Build

```bash
make build
```

## Usage

```bash
make run
```

or

```bash
docker run \
    --rm \
    -d \
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
    -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
    -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
    "naturalselect/nonameshapod:v1.10.4"
```

当点击需要下载资源文件时，请选择取消（Image内已内置）。