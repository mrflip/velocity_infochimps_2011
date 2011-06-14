ClusterChef.cluster 'spidermonkey' do
  use :defaults
  setup_role_implications
  recipe                "ubuntu"
  recipe                "hadoop_cluster::system_internals"
  
  cloud do
    backing             "ebs"
    image_name          "maverick"
    user_data           :get_name_from => 'broham'
  end

  # note that nfs_server requires special care on maverick
  facet 'home' do
    instances           1
    
    cloud.flavor        "m1.large"
    role                "nfs_server"
    role                "big_package"
  end

  facet 'webnode' do
    instances           1

    cloud.flavor        "m1.large"
    role                "nfs_client"
    role                "redis_client"
    role                "mysql_client"
    role                "elasticsearch_client"
    role                "big_package"
  end

  chef_attributes({
    })
end
