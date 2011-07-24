current_dir   = File.dirname(__FILE__)
organization  = ENV['CHEF_ORGANIZATION']      || 'velocity_infochimps'
username      = ENV['CHEF_USERNAME']          || 'velocity_infochimps'

cluster_chef_path        File.expand_path("#{current_dir}/../cluster_chef")

cookbook_path            ["#{cluster_chef_path}/cookbooks", "#{cluster_chef_path}/site-cookbooks", "#{current_dir}/../cookbooks", "#{current_dir}/../site-cookbooks"]
cluster_path              File.expand_path("#{current_dir}/../clusters")
keypair_path              File.expand_path("#{current_dir}/keypairs")

log_level                :info
log_location             STDERR
node_name                username
validation_client_name   "#{organization}-validator"
validation_key           "#{keypair_path}/#{organization}-validator.pem"
client_key               "#{keypair_path}/#{username}-client_key.pem"
chef_server_url          "https://api.opscode.com/organizations/#{organization}"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
bootstrap_chef_version   "~> 0.10.0"
$LOAD_PATH << "#{cluster_chef_path}/lib"

load "#{current_dir}/#{organization}-awskeys.rb"
