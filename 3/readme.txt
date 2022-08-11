Howto
=====

1. make build
2. ./start.sh <your-port>
3. make attach
4. make stop

The docker container
====================

1. Uses default nginx image (debian)
2. Uses custom nginx.conf which contains config for:
  a. Running nginx as user 'nginx' (uid 101)
  b. Serving static content from /opt/html
3. Dockerfile:
  a. Installs curl
  b. Installs gettext-base (to provide envsubst)
  c. Installs procps (to provide ps to check processes user)
     (Could also just use `whoami` in the container.)
  d. Uses `USER 101` so as to run the nginx process as user `nginx`
     (UID was determined by looking at /etc/password in the default container)
  e. Uses ENTRYPOINT to call a shell script which calls `envsubst` and then
     starts nginx
4. Files:
  a. conf/nginx.tmpl is the nginx.conf template which contains the ${PORT} variable
     which will get substituted with the value from the PORT environment variable.
  b. srv/entrypoint.sh
  c. html/index.html - sample static file
  d. Dockerfile
  e. Makefile - basic options which help limit typing
  f. start.sh script. This takes a port number as a parameter and passes
     that to the `docker` command as an environment variable which, in turn,
     gets passed to the container for `entrypoint.sh` and `envsubst` to use.

Testing
=======

Testing can be done within the container using the installed `curl`. `curl localhost:<port>`.
Likewise, testing can be performed from outside the container against the mapped port.
