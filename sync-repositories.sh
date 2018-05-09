#!/usr/bin/env sh
set -e

if [ ! -d origin ]; then
	origin_url=`echo $ORIGIN | cut -d@ -f2 | cut -d: -f1`
	remote_url=`echo $REMOTE | cut -d@ -f2 | cut -d: -f1`
	ssh-keygen -F $origin_url 2>/dev/null >/dev/null || ssh-keyscan $origin_url 2>/dev/null >> /root/.ssh/known_hosts
	ssh-keygen -F $remote_url 2>/dev/null >/dev/null || ssh-keyscan $remote_url 2>/dev/null >> /root/.ssh/known_hosts
	git clone --mirror $ORIGIN origin
	cd origin
	git remote add other $REMOTE
else
	cd origin
fi

git fetch origin --tags

git push other --force --all
git push other --force --tags
