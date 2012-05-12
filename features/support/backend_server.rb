require "sinatra"
require "json"
require "pry"

class BackendServer < Sinatra::Base
  class << self
    attr_accessor :last_validated_user
  end

  route 'OPTIONS', /.+/ do 
    content_type = 'text/plain'
    response['Access-Control-Allow-Origin'] = 'file://'
    response['Access-Control-Allow-Headers'] = 'x-requested-with, content-type'
    response['Access-Control-Allow-Credentials'] = 'true'
    halt 200
  end
  
  post "/validate" do 
    credentials = JSON.parse(request.body.read)
    self.class.last_validated_user = credentials
    response['Access-Control-Allow-Origin'] = 'file://'
    response['Access-Control-Allow-Headers'] = 'x-requested-with, content-type'
    response['Access-Control-Allow-Credentials'] = 'true'
    halt 200
  end
end

