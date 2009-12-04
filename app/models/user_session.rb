class UserSession < Authlogic::Session::Base
  
  def self.oauth_consumer
    OAuth::Consumer.new(Settings.twitter_consumer_key, Settings.twitter_consumer_secret, { :site=>"http://twitter.com" })
  end
  
end