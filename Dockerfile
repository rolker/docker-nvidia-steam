FROM nvidia/cudagl:11.3.0-runtime-ubuntu18.04

ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES},display

RUN export DEBIAN_FRONTEND=noninteractive && apt update && apt upgrade -y && apt install -y keyboard-configuration steam && apt clean

RUN export DEBIAN_FRONTEND=noninteractive && apt install -y mesa-utils && apt clean

RUN export DEBIAN_FRONTEND=noninteractive && apt install -y libnvidia-gl-460:i386 && apt clean

RUN export DEBIAN_FRONTEND=noninteractive && apt install -y less nano && apt clean


RUN useradd --create-home --shell /bin/bash gamer && adduser gamer sudo && echo "ALL ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER gamer

CMD /bin/bash
