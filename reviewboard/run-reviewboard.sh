#!/bin/bash

# Make sure we're not confused by old, incompletely-shutdown httpd
# context after restarting the container.  httpd won't start correctly
# if it thinks it is already running.
rm -rf /run/httpd/*

/usr/bin/rb-site upgrade /srv/reviewboard

exec /usr/sbin/apachectl -D FOREGROUND
