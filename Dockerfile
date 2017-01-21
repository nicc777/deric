FROM ubuntu:latest
MAINTAINER Nico Coetzee <nicc777@gmail.com>

LABEL Description="A container to use with development with eric6" Vendor="none" Version="0.1"

# http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/

RUN apt-get update && apt-get upgrade -y
RUN apt-get install libterm-readline-perl-perl -y
RUN apt-get install -y eric sudo

# PREP Developer User
# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

VOLUME ['/home/developer']

USER developer
ENV HOME /home/developer
CMD /usr/bin/eric
