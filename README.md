## docker-nvidia-steam

Builds a docker image for running Steam with NVidia acceleration.

This is for running the Ubuntu version of Steam on a machine where installing the i386 version of the gl libraries may not be pratical.

Inspired by:
  https://github.com/webanck/docker-wine-steam
  

# Usage

Run the build.sh script to build the image.

Before launching, create a docker_steam directory which will become your home directory in the container. This is used for persistance.

Use the launch.sh script to launch the container.

