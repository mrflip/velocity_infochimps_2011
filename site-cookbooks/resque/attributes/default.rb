
default[:resque][:dir]        = '/var/lib/resque'
default[:resque][:conf_dir]   = '/etc/resque'
default[:resque][:log_dir]    = '/var/log/resque'
default[:resque][:tmp_dir]    = '/mnt/tmp/resque'
default[:resque][:cluster_name] = node[:cluster_name]

default[:resque][:s3_ripd]       = 's3n://monkeyshines.infochimps.org/data/ripd/com.tw/com.twitter'
default[:resque][:s3_chunk_time] = '360000'   # 6 minutes

default[:resque][:deploy_dir] = '/usr/local/share/resque'

default[:resque][:user]       = 'resque'
default[:resque][:group]      = 'scraper'

default[:resque][:address]         = "localhost"
default[:resque][:port]            = "6388"
default[:resque][:web_port]        = "6389"
default[:resque][:namespace]       = "flamingo:resque"
default[:resque][:dbdir]           = "/data/db/resque"
default[:resque][:swapdir]         = "/data/db/resque"
default[:resque][:dbfile]          = "scrape_queue.rdb"
default[:resque][:client_timeout]  = "300"
default[:resque][:glueoutputbuf]   = "yes"
default[:resque][:vm_enabled]      = "yes"
default[:resque][:saves]           = [["900", "1"], ["300", "10"], ["60", "10000"]]
default[:resque][:slave]           = "no"
# default[:resque][:master_server] = "redis-master." + domain
# default[:resque][:master_port]   = "6388"
