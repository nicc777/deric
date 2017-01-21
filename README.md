# deric - docker eric6 solution

This is a docker image, based on the `firefox` [docker image](http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/) from Fábio Rehm.

## Installation

todo...

## Preperation

Build using the following command:

	$ docker build --no-cache -t deric:latest .

You also need to decide where you want to persist your projects (stopping the docker image will typically delete your files!!!)

For example, using your home directory mapped to the image's developer home:

	$ export DERIC_HOME=$HOME

## Running deric

To run, based on your preparation, use the following command:

	$ xhost +
    $ docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $DERIC_HOME:/home/developer deric

And that is it..