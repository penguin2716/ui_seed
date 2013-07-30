#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

require 'socket'
require 'twitter'
SOURCE = File.expand_path(File.join(File.dirname(__FILE__), 'source.rb'))

## Twitterのキーがある人は設定すると幸せになれる
# TWITTER_CONSUMER_KEY    = "AmDS1hCCXWstbss5624kVw"
# TWITTER_CONSUMER_SECRET = "KOPOooopg9Scu7gJUBHBWjwkXz9xgPJxnhnhO55VQ"
# TWITTER_TOKEN           = "66159300-uigYA04OU4O1PhFCBTHXRJJ1F1hEXSAICSps6Mz9k"
# TWITTER_SECRET          = "80kW7WMFGzZ2t6n0uBJtEidPN3igpAhIYd9XJorSE"
# Twitter.configure do |c|
#   c.consumer_key       = TWITTER_CONSUMER_KEY
#   c.consumer_secret    = TWITTER_CONSUMER_SECRET
#   c.oauth_token        = TWITTER_TOKEN
#   c.oauth_token_secret = TWITTER_SECRET
# end
# @twitter = Twitter.client

server = TCPServer.open('0.0.0.0', 0x3939)

def process_it(str)
  puts str
  # @twitter.update str
end

loop do
  client = server.accept
  client.write open(SOURCE).read
  while client.gets
    process_it $_
  end
  client.close
end

