#!/bin/sh


# Build command for nvidia-docker2
sudo nvidia-docker build -t mjmg/centos-mro-rstudio-opencpu-shiny-server .

# Build command for nvidia-docker 1
#NV_DOCKER='sudo docker -D' sudo nvidia-docker build -t mjmg/centos-mro-rstudio-opencpu-shiny-server .
