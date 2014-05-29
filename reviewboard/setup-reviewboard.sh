#!/bin/bash

# Set all values below appropriately for this site
RB_DOMAIN_NAME=changeme.example.test
RB_SITE_ROOT=/reviewboard/

# Database values
RB_DB_TYPE=postgresql #postgresql or mysql
RB_DB_NAME=reviewboard
RB_DB_HOST=changeme.database.test
RB_DB_USER=reviewboard
RB_DB_PASS=reviewboardpass

# Cache configuration
RB_CACHE_TYPE=memcached #memcached or file
RB_CACHE_INFO=memcached.example.test:11211 # For file, use path

# Webserver configuration
RB_WEB_TYPE=apache #apache or lighttpd
RB_PYTHON_LOADER=wsgi #wsgi or fastcgi

# Users
RB_ADMIN_USER=admin
RB_ADMIN_PASS=changeme
RB_ADMIN_EMAIL=noreply@example.test

/usr/bin/rb-site install --noinput \
   --domain-name=$RB_DOMAIN_NAME \
   --site-root=$RB_SITE_ROOT \
   --db-type=$RB_DB_TYPE \
   --db-name=$RB_DB_NAME \
   --db-host=$RB_DB_HOST \
   --db-user=$RB_DB_USER \
   --db-pass=$RB_DB_PASS \
   --cache-type=$RB_CACHE_TYPE \
   --cache-info=$RB_CACHE_INFO \
   --web-server-type=$RB_WEB_TYPE \
   --python-loader=$RB_PYTHON_LOADER \
   --admin-user=$RB_ADMIN_USER \
   --admin-pass=$RB_ADMIN_PASS \
   --admin-email=$RB_ADMIN_EMAIL \
   /srv/reviewboard

chown apache.apache chown apache.apache \
    /srv/reviewboard/htdocs/media/uploaded \
    /srv/reviewboard-docker/htdocs/media/ext \
    /srv/reviewboard-docker/htdocs/static/ext \
    /srv/reviewboard-docker/data

ln -s /srv/reviewboard/conf/apache-wsgi.conf /etc/httpd/conf.d/reviewboard.conf
