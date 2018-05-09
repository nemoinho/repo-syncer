#!/usr/bin/env sh
set -e

[ ! -d /root/.ssh ] && mkdir -m 700 /root/.ssh
if [ ! -f /root/.ssh/id_rsa ]; then
	cp /ssh-template/id_rsa /root/.ssh/id_rsa
	chmod 600 /root/.ssh/id_rsa
	touch /root/.ssh/known_hosts
	chmod 644 /root/.ssh/known_hosts
	chown root:root /root/.ssh/id_rsa /root/.ssh/known_hosts
fi

sync-repositories

exec crond -f
