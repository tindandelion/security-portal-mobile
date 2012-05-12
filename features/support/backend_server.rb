require "sinatra"
require "json"
require "pry"

class BackendServer < Sinatra::Base
  class << self
    attr_accessor :last_validated_user
  end
  
  post "/validate" do 
    credentials = JSON.parse(request.body.read)
    self.class.last_validated_user = credentials
    halt 200
  end
end

