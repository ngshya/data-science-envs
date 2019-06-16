FROM ubuntu:18.04
MAINTAINER ngshya
RUN echo "root:root" | chpasswd
RUN useradd -m -s /bin/bash user
RUN echo "user:user" | chpasswd
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
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN systemctl enable ssh
RUN service ssh start
RUN /etc/init.d/rstudio-server stop
RUN /etc/init.d/rstudio-server start
CMD bash

 
