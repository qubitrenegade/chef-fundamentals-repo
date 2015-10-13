#
# Cookbook Name:: mailx
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
package 'install mailx' do
  case node[:platform]
  when 'redhat', 'cents'
    package_name 'mailx'
  when 'ubuntu', 'debian'
    package_name 'mailutils'
  end
  action :install
end
