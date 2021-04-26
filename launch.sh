#!/bin/sh

docker run -it \
		--runtime=nvidia \
		-e DISPLAY \
		-e NVIDIA_DRIVER_CAPABILITIES=all \
		-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
		-v ~/.Xauthority:/home/gamer/.Xauthority \
		--ipc="host" \
		--device=/dev/snd:/dev/snd \
		--device=/dev/dri:/dev/dri \
		-v /run/user/`id -u`/pulse/native:/run/user/`id -u`/pulse/native \
		--mount type=bind,source="$(pwd)"/docker_steam,target=/home/gamer \
		--net=host \
		--restart=no \
		rolker/docker-nvidia-steam:latest \
		bash
