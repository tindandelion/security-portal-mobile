require "pathname"
require Pathname(__FILE__).parent + "server" + "backend_server"

BackendServer.create_company "Demo Company" do |company|
  company.add_user "demo", "demo"
end

run BackendServer