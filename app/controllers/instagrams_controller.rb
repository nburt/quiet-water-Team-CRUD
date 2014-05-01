class InstagramsController <ApplicationController
  require "instagram"
  require 'pp'

  CALLBACK_URL = "http://localhost:4567/oauth/callback"

  Instagram.configure do |config|
    config.client_id = ENV['CLIENT_ID']
    config.client_secret = ENV['CLIENT_SECRET']
  end

  def index
    
    @html = Instagram.media_search("40.0176335","-105.2819911")

  end


end