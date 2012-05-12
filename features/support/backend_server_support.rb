require_relative "backend_server"

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
  BackendServer.run!
end
