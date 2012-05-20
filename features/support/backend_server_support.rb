require "timeout"
require_relative "../../server/backend_server"

module BackendServerSupport
  REQUEST_TIMEOUT = 10
  
  def server
    BackendServer
  end
  
  def wait_for_validated_user
    Timeout.timeout REQUEST_TIMEOUT do 
      creds = server.last_validated_user
      until creds
        sleep 0.1
        creds = server.last_validated_user
      end
      return creds
    end
  end
  
  def verify_validated_user(username, password)
    creds = wait_for_validated_user
    creds.should == {"username" => username, "password" => password}
  end
  
  def add_user(username, password)
    server.add_user username, password
  end
end

World(BackendServerSupport)

Before do 
  BackendServer.reset
end

Thread.new do 
  BackendServer.run!
end
