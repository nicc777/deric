# deric - docker eric6 solution

This is a docker image, based on the `firefox` [docker image](http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/) from Fábio Rehm.

## Installation

Get the docker file... Easiest way:

	$ wget https://github.com/nicc777/deric/blob/master/Dockerfile

of course you can also clone the repository.

## Preperation

Build using the following command:

	$ docker build --no-cache -t deric:latest .

You also need to decide where you want to persist your projects (stopping the docker image will typically delete your files!!!)

For example, using your home directory mapped to the image's developer home:

	$ export DERIC_HOME=$HOME

Or, if you would like a dedicated area:

	$ mkdir $HOME/Eric6
    $ export DERIC_HOME=$HOME/Eric6

## Running deric

To run, based on your preparation, use the following command:

	$ xhost +
    $ docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $DERIC_HOME:/home/developer deric

## Adding python libraries and other stuff 

Sometimes you may need a terminal to install additional libraries or packages or just do some random stuff...

Open another terminal and run the following command to connect to a terminal of the running `deric` instance (assuming only one instance is running):

	$ docker exec -i -t `docker ps | grep deric | awk '{print $NF}'` /bin/bash

And that is it.. You can now install other python libraries and stuff.

To persist these, run the following in your doscker image terminal:

	$ cd
	$ pip3 freeze > requirements.txt
