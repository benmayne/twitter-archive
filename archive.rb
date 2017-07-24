require 'tweetstream'
require 'internet_archive'
require 'yaml'

CONFIG = YAML.load(File.new('./config.yaml'))

TweetStream.configure do |config|
  config.consumer_key = CONFIG['twitter_app_key']
  config.consumer_secret = CONFIG['twitter_app_secret']
  config.oauth_token = CONFIG['twitter_oauth_token']
  config.oauth_token_secret = CONFIG['twitter_oauth_token_secret']
  config.auth_method = :oauth
end

client = TweetStream::Client.new

warn CONFIG
client.userstream do |status|
  puts status.text
end
