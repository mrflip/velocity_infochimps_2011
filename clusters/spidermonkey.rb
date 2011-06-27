ClusterChef.cluster 'spidermonkey' do
  use :defaults
  setup_role_implications
  recipe                "ubuntu"
  role                  "big_package"
  recipe                "big_package::emacs"
  recipe                "hadoop_cluster::system_internals"
  
  cloud do
    backing             "ebs"
    image_name          "maverick"
    user_data           :get_name_from => 'broham'
  end

  facet 'webnode' do
    instances           2

    cloud.flavor        "t1.micro"
    role                "nfs_client"
    role                "spidmo_api"
  end

  facet 'scraper_master' do
    instances           1

    cloud.flavor        "m1.large"
    role                "nfs_client"
    # role              "spidmo_scraper"
    role                "flume_slave"
    role                "redis_server"
  end

  facet 'scraper_worker' do
    instances           1

    cloud.flavor        "m1.large"
    role                "nfs_client"
    # role              "spidmo_scraper"
    role                "flume_slave"
  end

  # note that nfs_server requires special care on maverick
  facet 'home' do
    instances           1
    
    cloud.flavor        "m1.small"
    role                "nfs_server"
  end

  chef_attributes({
    })
end
