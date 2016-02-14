#!/bin/bash

set -e

# Need to initialize?
if [ ! -e /.initialized ]; then
    echo "[Global]
    mimic model = TimeCapsule6,106
	log file = /var/log/afpd.log
	log level = default:warn
	uam list = uams_guest.so
	zeroconf = yes

[Storage]
	path = /storage

[TimeMachine]
	path = /timemachine
	time machine = yes" >> /usr/local/etc/afp.conf

    # Initiate the timemachine daemons
    chown -R nobody:nogroup /timemachine
    chmod -R 777 /timemachine

    chown -R nobody:nogroup /storage
    chmod -R 777 /storage
    
    touch /.initialized
fi

# Initate DBUS
if [ -e /var/run/dbus/pid ]; then rm -f /var/run/dbus/pid; fi
mkdir -p /var/run/dbus
chown messagebus:messagebus /var/run/dbus
dbus-uuidgen --ensure
sleep 1

dbus-daemon --system --nofork &
/etc/init.d/netatalk start
/etc/init.d/avahi-daemon start

/bin/bash
