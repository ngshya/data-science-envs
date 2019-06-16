FROM Ubuntu:18.04
RUN apt update
RUN apt dist-upgrade -y
RUN apt -y install python3-pip \
 nano \
 git
 
