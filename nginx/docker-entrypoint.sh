#!/bin/bash

GIT=`env | grep ^GitConnectionString|awk -F= '{print $2}'`
mkdir /tmp/git
echo Cloning Repository...
git clone $GIT /tmp/git
#cp /tmp/git/default.stream /etc/nginx/conf.d/default.stream
echo Copy Config...
cp /tmp/git/* /etc/nginx/conf.d/
echo Starting Nginx...
nginx -g 'daemon off;'
#while [ 1 ]; do printf .; sleep 5; done
