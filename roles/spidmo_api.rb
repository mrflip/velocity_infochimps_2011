name        "spidmo_api"
description "Prepares a node to serve the spidermonkey API"

# List of recipes and roles to apply
run_list(*%w[
  nginx
  unicorn
  rvm
  rvm::ruby_192
  rvm::gem_package
  apey_eye_endpoints
  apey_eye_endpoints::apey_eye_endpoints
  apey_eye_endpoints::elasticsearch_proxy
  spidmo_api
  spidmo_api::server
])

override_attributes({
    :spidmo_api => {
      :environment            => 'staging'
    },
    :rvm => {:gem_package => { :rvm_string => "ruby-1.9.2"} }
  })

