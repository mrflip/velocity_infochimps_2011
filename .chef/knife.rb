current_dir   = File.dirname(__FILE__)
organization  = ENV['CHEF_ORGANIZATION']      || 'velocity_infochimps'
username      = ENV['CHEF_USERNAME']          || 'velocity_infochimps'

cookbook_root = ENV['PATH_TO_COOKBOOK_REPOS'] || File.expand_path('~/ics/sysadmin')
cluster_chef_path File.expand_path("#{current_dir}/..")
keypair_path      File.expand_path(current_dir+"/keypairs")

log_level                :info
log_location             STDERR
node_name                username
client_key               "#{current_dir}/#{username}-client_key.pem"
validation_client_name   "#{organization}-validator"
validation_key           "#{current_dir}/#{organization}-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/#{organization}"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks", "#{current_dir}/../site-cookbooks"]

load "#{current_dir}/#{organization}-awskeys.rb"
