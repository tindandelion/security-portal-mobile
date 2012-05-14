require "sinatra"
require "json"

class BackendServer < Sinatra::Base
  class << self
    attr_accessor :last_validated_user
    
    def reset
      self.last_validated_user = nil
    end
  end
  
  post "/validate" do 
    credentials = JSON.parse(request.body.read)
    puts credentials.inspect
    self.class.last_validated_user = credentials
    halt 200
  end
end

