
#
# register with load balancer
#
if node[:spidmo_api][:environment] == 'production'
  load_balancer node[:spidmo_api][:load_balancer]
end

# spidmo_api -- nginx config file
template File.join(node[:nginx][:dir], 'sites-available/spidmo_api.conf') do
  owner  "root"
  mode   "0644"
  source "spidmo_api.nginx.conf.erb"
  # variables({:flume => true})   # FIXME
end

nginx_site 'spidmo_api.conf' do
  action :enable
end

provide_service('spidmo_api', :spidmo_api_ports => node[:spidmo_api][:port])
