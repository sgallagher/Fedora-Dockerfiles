#!/bin/bash

__mod_user() {
usermod -G wheel postgres
}

__create_db() {
su --login postgres --command "/usr/bin/postgres -D /var/lib/pgsql/data -p 5432" &
sleep 10
ps aux

PG_DB=dockerdb
PG_USER=dockeruser
PG_PASS=password

if [ x$1 != x ]; then
    PG_DB=$1
fi

if [ x$2 != x ]; then
    PG_USER=$2
fi

if [ x$1 != x ]; then
    PG_PASS=$3
fi

su --login - postgres --command "psql -c \"CREATE USER $PG_USER with CREATEROLE superuser PASSWORD '$PG_PASS';\""
su --login - postgres --command "psql -c \"CREATE DATABASE $PG_DB;\""
su --login - postgres --command "psql -c \"\du;\""
}

# Call functions
__mod_user
__create_db $@
