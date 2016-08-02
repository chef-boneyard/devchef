#/bin/bash -xe

cat <<EOF > /etc/chef/client.rb
log_location  '/var/log/chef-client.log'
chef_server_url '${SERVER_URL}/organizations/${ORG_NAME}'
validation_client_name '${VALIDATOR_NAME}'
validation_key '${VALIDATOR_KEY}'
node_name '${HOSTNAME}'
EOF

knife ssl fetch -c /etc/chef/client.rb

chef-client &

tail -f /var/log/chef-client.log
