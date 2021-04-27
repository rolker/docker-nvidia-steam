#!/bin/sh

docker run -it \
		--runtime=nvidia \
		-e DISPLAY \
		-e NVIDIA_DRIVER_CAPABILITIES=all \
		-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
		-v ~/.Xauthority:/home/gamer/.Xauthority \
		--ipc="host" \
		--device=/dev/snd \
		-v /run/user/`id -u`/pulse:/run/user/1000/pulse \
		--group-add $(getent group audio | cut -d: -f3) \
		--mount type=bind,source="$(pwd)"/docker_steam,target=/home/gamer \
		--mount type=bind,source=`echo ~/.config/pulse`,target=/home/gamer/.config/pulse \
		--net=host \
		--restart=no \
		rolker/docker-nvidia-steam:latest \
		bash
