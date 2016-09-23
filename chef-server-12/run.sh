#!/bin/bash -xe

#set -x
export PATH=/opt/opscode/bin:$PATH

# Start this so that chef-server-ctl sv-related commands can
# interact with its services via runsv
/opt/opscode/embedded/bin/runsvdir-start &

chef-apply setup.rb

# Something useful that also keeps the container running...
tail -f /var/log/opscode/nginx/access.log
