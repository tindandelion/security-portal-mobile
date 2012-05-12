require "timeout"
require_relative "backend_server"

module BackendServerSupport
  TIMEOUT = 10
  
  def server
    BackendServer
  end
  
  def wait_for_validated_user
    Timeout.timeout TIMEOUT do 
      creds = server.last_validated_user
      until creds
        sleep 0.1
        creds = server.last_validated_user
      end
      return creds
    end
    fail "No user was validated within #{TIMEOUT} seconds"
  end
  
  def verify_validated_user(username, password)
    creds = wait_for_validated_user
    creds.should == {"username" => username, "password" => password}
  end
end

World(BackendServerSupport)

Thread.new do 
  BackendServer.run!
end
