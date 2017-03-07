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

    chown terra:terra /home/terra/.ssh
    chown terra:terra /home/terra/.drush

    ln -s /var/www/html /home/terra/html
    ln -s /app /home/terra/app
fi

echo $AUTHORIZED_KEYS > /home/terra/.ssh/authorized_keys

/usr/sbin/sshd -D