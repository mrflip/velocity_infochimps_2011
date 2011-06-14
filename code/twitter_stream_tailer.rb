require 'rubygems'
require 'twitter/json_stream'

EventMachine::run {
  stream = Twitter::JSONStream.connect(
    :path    => '/1/statuses/filter.json?track=football',
    :auth    => 'LOGIN:PASSWORD'
  )

  stream.each_item do |item|
    # Do someting with unparsed JSON item.
  end

  stream.on_error do |message|
    # No need to worry here. It might be an issue with Twitter.
    # Log message for future reference. JSONStream will try to reconnect after a timeout.
  end

  stream.on_max_reconnects do |timeout, retries|
    # Something is wrong on your side. Send yourself an email.
  end
}
