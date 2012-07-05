require "timeout"
require_relative "../../server/backend_server"

module BackendServerSupport
  REQUEST_TIMEOUT = 10
  
  def backend
    BackendServer
  end
  
  def wait_for_validated_user
    Timeout.timeout REQUEST_TIMEOUT do 
      creds = backend.last_validated_user
      until creds
        sleep 0.1
        creds = backend.last_validated_user
      end
      return creds
    end
  end
  
  def verify_validated_user(username, password)
    creds = wait_for_validated_user
    creds.should == {"login" => username, "password" => password}
  end
  
  def password_for_user(username)
    backend.password_for_login(username)
  end
end

World(BackendServerSupport)

Before do 
  BackendServer.reset
end

Thread.new do 
  BackendServer.run! do |webrick|
    webrick.config[:AccessLog] = [] unless ENV['LOGGING'] == "true"
  end
end
