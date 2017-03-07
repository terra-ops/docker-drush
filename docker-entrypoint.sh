#!/bin/sh
set -ex

if [ ! `id -u terra` ]; then
    # Create app user
    addgroup --gid $HOST_GID terra

    echo $HOST_UID
    echo $HOST_GID

    adduser --uid $HOST_UID --gid $HOST_GID --system  --disabled-password --home /home/terra terra

    mkdir /home/terra/.ssh
    mkdir /home/terra/.drush

    echo $AUTHORIZED_KEYS > /home/terra/.ssh/authorized_keys

    chown terra:terra /home/terra/.ssh -R
    chown terra:terra /home/terra/.drush -R

    ln -s /var/www/html /home/terra/html
    ln -s /app /home/terra/app
fi


/usr/sbin/sshd -D