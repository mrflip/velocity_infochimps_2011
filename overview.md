
git clone
git submodule update

https://velocityinfochimps.prefinery.com/signin
velocity11.infochimps.com

pw heymonkeyboy


cd cluster_chef
bundle install

generate keypair
chmod -R og-rwx .chef/keypairs


open security port for graphite

https://github.com/bvandenbos/statsd-client




graphite + statsd + goliath for auth


search + infochimps => return

monitor my search terms

resque + scraper => file

file => flume => decorator => database


load balancer:
* spidmo-api-503967728.us-east-1.elb.amazonaws.com
* spidermonkey.infochimps.com


# (Assumes you've already run the bootstrap and the specs -- or otherwise
# populated the account database)
#
#   /usr/local/share/mongo/bin/mongod & # or whatever
#
# Add your name to the whitelist &/or drop a line like this in the config/app.rb file:
#
#   db.collection('AccountInfo').save({ :_id => 'YOUR_APIKEY', :valid => true,  :max_call_rate => 1_000_000, :max_ip_rate => 1_000_000 })
#
# Start the server:
#
#   ./app/apey_eye_proxy.rb -sv -p 9002 --config $PWD/config/app.rb
#
#
#
#   curl -vv 'http://127.0.0.1:9001/social/network/tw/influence/trstrank?_apikey=YOUR_APIKEY&screen_name=mrflip'



