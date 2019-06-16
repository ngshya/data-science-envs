FROM ubuntu:18.04
RUN apt update
RUN apt dist-upgrade -y
RUN apt -y install htop \
 nano \
 git \
 python3-pip \
 r-base \
 r-base-dev \
 r-recommended
 
