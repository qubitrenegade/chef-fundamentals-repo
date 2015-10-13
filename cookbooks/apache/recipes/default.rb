#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apache::ohai_plugin'

package "httpd" do
  action :install
end

ruby_block "randomly_choose_language" do
  block do
    if Random.rand > 0.5
      node.run_state['scripting_language'] = 'php'
    else
      node.run_state['scripting_language'] = 'perl'
    end
  end
end

package 'scripting_language' do
  package_name lazy { node.run_state['scripting_language'] }
  action :install
end

apache_vhost "lions" do
  site_port 8080
  action :create
  notifies :restart, "service[httpd]"
end

service "httpd" do
  action [ :enable, :start ]
end

apache_vhost "clowns" do
  action :remove
  notifies :restart, "service[httpd]"
end
