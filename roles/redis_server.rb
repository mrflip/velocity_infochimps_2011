name        'redis_server'
description 'redis server'

run_list(*%w[
  redis
  redis::install_from_release
  redis::server
])
