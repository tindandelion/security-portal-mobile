require "sinatra"

class BackendServer < Sinatra::Base
  class << self
    attr_accessor :last_validated_user
  end
  
  post "/validate" do 
    credentials = JSON.parse(request.body.read)
    self.class.last_validated_user = credentials
  end
end

module BackendServerSupport
  def server
    BackendServer
  end
  
  def validated_user
    server.last_validated_user
  end
end

World(BackendServerSupport)

Thread.new do 
  BackendServer.run!(:threaded => true)
end
