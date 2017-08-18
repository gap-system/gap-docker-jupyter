# Docker container for the GAP Jupyter interface

This Docker container is built on top of the Docker container for GAP and
packages located at https://hub.docker.com/r/gapsystem/gap-docker/. It
allows to use GAP via the experimental GAP Jupyter interface that is 
being developed at https://github.com/gap-packages/jupyter-gap.

If you have installed Docker, first you need to download the GAP container using
```
docker pull gapsystem/gap-docker-jupyter
```
(the same command is needed if you need to pull the new GAP container to get a
new GAP release). After that, you can start the GAP container by typing the
following in a terminal:
```
docker run -p 8888:8888 -i -t --net="host" gapsystem/gap-docker-jupyter
```
(The `--net="host"` option is essential, for example, for GAP packages 
downloading external data like AtlasRep).

Note that you may have to run `docker` with `sudo`, particularly if you are on Ubuntu.

When the container will be started, it will display further instructions
with the link to open in the browser on the host machine. Please note that
on Windows and OS X you will have to replace 0.0.0.0 in http://0.0.0.0:8888/ 
by the IP address of the virtual machine (see the documentation for your
version of Docker on how to determine the IP address).

Note that this container contains a fully functional GAP installation that
can be also run from a command line. For further instructions and command
line options see https://hub.docker.com/r/gapsystem/gap-docker/.
