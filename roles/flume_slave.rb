name        'flume_slave'
description 'flume slave'

run_list(*%w[
  hadoop_cluster::default
  flume::node
  flume::jruby_plugin
])


