FROM ubuntu:18.04
MAINTAINER ngshya
ENV TZ=Europe/Rome
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update
RUN apt dist-upgrade -y
RUN apt -y install htop \
 nano \
 git \
 python3-pip \
 r-base \
 r-base-dev \
 r-recommended \
 gdebi-core \
 wget \
 openssh-server
RUN wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.2.1335-amd64.deb
RUN gdebi -n rstudio-server-1.2.1335-amd64.deb
RUN systemctl enable ssh
EXPOSE 8787
 
