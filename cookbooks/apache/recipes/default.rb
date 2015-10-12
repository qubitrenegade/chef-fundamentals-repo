#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "httpd" do
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
