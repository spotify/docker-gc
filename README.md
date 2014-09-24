docker-gc
=========

A simple docker container and image garbage collection script.

* Containers that exited more than an hour ago are removed.
* Images that don't belong to any remaining container after that are removed.

Although docker normally prevents removal of images that are in use by
containers, we take extra care to not remove any image tags (e.g. ubuntu:14.04,
busybox, etc) that are in use by containers. A naive `docker rmi $(docker images
-q)` will leave images stripped of all tags, forcing docker to re-pull the
repositories when starting new containers even though the images themselves are
still on disk.

This script is intended to be run as a cron job.

Building
--------

Build the debian package:

```sh
$ apt-get install git devscripts
$ git clone https://github.com/spotify/docker-gc.git
$ cd docker-gc
$ debuild -us -uc -b
```


Installing
----------

```sh
$ dpkg -i ../docker-gc_0.0.1_all.deb
```

This installs the `docker-gc` script into `/usr/sbin` and drops a `docker-gc` cron
file into `/etc/cron.hourly/`.


Usage
-----

To use the script manually, run `docker-gc`.
