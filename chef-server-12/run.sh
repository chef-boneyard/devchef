#!/bin/bash -xe

#set -x
export PATH=/opt/opscode/bin:/opt/opscode/bin/embedded:$PATH

# Start this so that chef-server-ctl sv-related commands can
# interact with its services via runsv
/opt/opscode/embedded/bin/runsvdir-start &
chef-server-ctl reconfigure

# Copy keys to exposed volume
mkdir -p /volumes/keys
cp /keys/* /volumes/keys

# Output current state of things for sanity's sake
chef-server-ctl status

# Something useful that also keeps the container running...
tail -f /var/log/opscode/nginx/access.log
