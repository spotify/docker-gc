docker-gc
=========

A simple docker container and image garbage collection script.

* Containers that exited more than an hour ago are removed.
* Images that have existed more than an hour and are not in use by any
  containers are removed.

Although docker normally prevents removal of images that are in use by
containers, we take extra care to not remove any image tags (e.g. ubuntu:14.04,
busybox, etc) that are in use by containers. A naive `docker rmi $(docker images
-q)` will leave images stripped of all tags, forcing docker to re-pull the
repositories when starting new containers even though the images themselves are
still on disk.

This script is intended to be run as a cron job. It is stateful and stores its
between-run state in /var/run/docker-gc by default, overridable by setting
$STATE_DIR.


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

To use the script manually, run `docker-gc -f` to override the lastgc timestamp
guard. This will immediately remove any exited containers. To remove images, run
`docker-gc -f` a second time. Only images that existed during the previous run
are removed. This is in order to keep unused images around for at least an hour
when run as a cron job, to minimize interference with manual docker pulls etc.
