require 'spec_helper'

describe 'cookbook_name::recipe_name' do
  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new
    runner.converge(described_recipe)
  end
  it 'does something' do
    expect(chef_runt).to action_resourcetype('NAME OF THE RESOURCE')
  end

end
