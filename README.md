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
    -e NONAME_HOST_MAX_CHAR_NUM=0 \
    -e NONAME_HOST_ALLOW_FREE_CHOOSE=false \
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

## Config

|Env|Description|
|-|-|
|NONAME_HOST_MAX_CHAR_NUM|作为联机宿主机时，每个玩家最大的基本候选将个数（身份局）。|
|NONAME_HOST_ALLOW_FREE_CHOOSE|联机模式选将（身份局）。|