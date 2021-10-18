#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
package 'apache2' do
  action :install
end

service 'apache2' do
  action %i[enable start]
  subscribes :reload, 'template[apache2.conf]'
end

template 'apache2.conf' do
  path '/etc/apache2/apache2.conf'
  owner 'root'
  group 'root'
  mode '0644'
  # notifies :reload, 'service[apache2]'
  variables(
    hostname: node['hostname']
  )
end
