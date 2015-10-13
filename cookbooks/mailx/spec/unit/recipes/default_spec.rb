#
# Cookbook Name:: mailx
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'mailx::default' do
  context 'on Ubuntu' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new({ :platform => 'ubuntu',
                                            :version => 14.04
      })
      runner.converge(described_recipe)
    end
    it 'should install the correct packages' do
      expect(chef_run).to install_package('install mailx').with({ 
                                            :package_name => 'mailutils'
      })
    end
  end

  context 'on Centos' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new({ :platform => 'centos',
                                            :version => 6.5
      })
      runner.converge(described_recipe)
    end
    it 'should install the correct packages' do
      expect(chef_run).to install_package('install mailx').with({
                                            :package_name => 'mailx'
      })
    end
  end

  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
