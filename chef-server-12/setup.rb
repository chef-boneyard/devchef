file '/etc/opscode/chef-server.rb' do
  content <<-EOH
topology 'standalone'
api_fqdn '#{ENV['CHEF_FQDN']}'
nginx['server_name'] = '#{ENV['CHEF_FQDN']}'
nginx['dhparam_key_length'] = 1024
  EOH
end

execute 'chef-server-ctl reconfigure'

execute 'create user' do
  command <<-EOH
chef-server-ctl user-create #{ENV['CHEF_USER']} #{ENV['CHEF_NAME']} \
  #{ENV['CHEF_EMAIL']} #{ENV['CHEF_PASS']} --filename /volumes/keys/#{ENV['CHEF_USER']}.pem
  EOH
  creates "/volumes/keys/#{ENV['CHEF_USER']}.pem"
end

execute 'create org' do
  command <<-EOH
chef-server-ctl org-create #{ENV['CHEF_ORG_SHORT']} #{ENV['CHEF_ORG_FULL']} \
  -a #{ENV['CHEF_USER']} --filename /volumes/keys/#{ENV['CHEF_ORG_SHORT']}_validator.pem
  EOH
  creates "/volumes/keys/#{ENV['CHEF_ORG_SHORT']}_validator.pem"
end

%w( pivotal webui_priv ).each do |key|
  execute "copy #{key} to volumes/keys" do
    command "cp /etc/opscode/#{key}.pem /volumes/keys/#{key}.pem"
  end
end
