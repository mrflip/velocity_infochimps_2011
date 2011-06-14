runit_service 'spidmo_api' do
  run_restart false
end

gem_package "bundler"

directory File.join(node[:spidmo_api][:dir], "shared") do
  group 'admin'
  mode 0755
  recursive true
  action :create
end

# Dirs that must be writable by web servers
%w[shared/tmp shared/log].each do |dir|
  directory File.join(node[:spidmo_api][:dir], dir) do
    owner node[:spidmo_api][:user]
    group 'admin'
    mode 0755
    recursive true
    action :create
  end
end

deploy_revision node[:spidmo_api][:dir] do
  # deploy options
  action                :deploy
  group                 'admin'
  environment           "RACK_ENV" => node[:spidmo_api][:environment]

  # clone
  repo                  node[:spidmo_api][:git_url]
  branch                node[:spidmo_api][:environment]
  enable_submodules     true
  shallow_clone         true

  # simple app
  purge_before_symlink(['log', 'tmp'])
  create_dirs_before_symlink(['tmp'])
  symlinks({'tmp/pids' => 'tmp/pids', 'log' => 'log'})
  migrate false

  before_restart do
    #GOTCHA When shelling out, the system ruby 1.8 is used to invoke
    #bundler. Invoke RVM here explicitly
    bash "rvm 1.9.2 exec config/bootstrap.rb" do
      cwd File.join(node[:spidmo_api][:dir],'current')
      code "rvm 1.9.2 exec config/bootstrap.rb"
    end
  end

  restart_command "sv restart spidmo_api"
end

