gem_package 'thin'
gem_package 'rack'

[ node[:flying_monkey][:dbdir],
  node[:flying_monkey][:swapdir],
].each do |dir|
  directory dir do
    owner     node[:flying_monkey][:user]
    group     node[:flying_monkey][:group]
    mode      "0775"
    recursive true
    action    :create
  end
end

#
# Config
#

# Redis
template File.join(node[:flying_monkey][:conf_dir], 'resque-redis.conf') do
  source 'resque-redis.conf.erb'
  mode 0664
  group 'admin'
  action :create
end
# resque-web
template File.join(node[:flying_monkey][:conf_dir], 'resque-web.rb') do
  source 'resque-web.rb.erb'
  mode 0664
  group 'admin'
  action :create
end

#
# Daemonize
#

runit_service 'resque_queue' do
  run_restart false
end
provide_service('resque_queue', :port => node[:resque][:port])

runit_service 'resque_web' do
  run_restart false
end
provide_service('resque_web', :port => node[:resque][:web_port])


