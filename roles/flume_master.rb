name        'flume_master'
description 'flume master'

run_list(*%w[
  hadoop_cluster::default
  flume::master
  flume::node
  flume::jruby_plugin
])
