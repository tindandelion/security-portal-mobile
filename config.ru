require "pathname"
require Pathname(__FILE__).parent + "server" + "backend_server"

$stdout.sync = true

BackendServer.with_company "Demo Company" do |company|
  company.add_user "demo", "demo"
  company.summary = {
    critical: 5,
    warning: 10,
    protected: 16
  }
end

use Rack::Deflater
run BackendServer