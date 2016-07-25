#!/bin/bash

export PATH=/opt/opscode/bin:/opt/opscode/embedded/bin:$PATH

set -x

echo "api_fqdn 'chef-server'" > /etc/opscode/chef-server.rb
echo "127.0.0.1  chef-server.local chef-server" >> /etc/hosts
echo "nginx['server_name'] = 'chef-server'" >> /etc/opscode/chef-server.rb
# Helps keep build time down
echo "nginx['dhparam_key_length'] = 1024" >> /etc/opscode/chef-server.rb

# runsvdir-start is our init supervisor and will allow
# chef-server services to be started
/opt/opscode/embedded/bin/runsvdir-start &
pid=$!
sleep 1

chef-server-ctl reconfigure
opscode-push-jobs-server-ctl reconfigure

mkdir /keys
chef-server-ctl user-create $CHEF_USER $CHEF_NAME $CHEF_EMAIL $CHEF_PASS --filename /keys/$CHEF_USER.pem
chef-server-ctl org-create $CHEF_ORG_SHORT $CHEF_ORG_FULL -a $CHEF_USER --filename /keys/${CHEF_ORG_SHORT}_validator.pem
cp /etc/opscode/pivotal.pem /keys/pivotal.pem
cp /etc/opscode/webui_priv.pem /keys/webui_priv.pem

# Force redis to serialize before we stop
redis-cli bgrewriteaof

# Stop all services normally so that we can ensure
# everything is in a good state
chef-server-ctl stop

# Terminate the init supervisor
kill -15 $pid
