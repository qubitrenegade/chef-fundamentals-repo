use_inline_resources


action :create do
  # set document root
  document_root = "/srv/apache/#{new_resource.site_name}"

  # Add template for Apache virtual host config
  template "/etc/httpd/conf.d/#{new_resource.site_name}.conf" do
    source 'custom.erb'
    mode '0644'
    variables(
      :document_root => document_root,
      :port => new_resource.site_port
    )
  end
  
  directory document_root do
    mode "0755"
    recursive true
  end

  template "#{document_root}/index.html" do
    source "index.html.erb"
    mode "0644"
    variables(
      :site_name => new_resource.site_name,
      :port => new_resource.site_port
    )
  end

end

action :remove do
  # set document root
  document_root = "/srv/apache/#{new_resource.site_name}"

  directory document_root do
    action :delete
    recursive true
  end

  file "/etc/httpd/conf.d/#{new_resource.site_name}.conf" do
    action :delete
  end
end
