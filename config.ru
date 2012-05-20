require "pathname"
require Pathname(__FILE__).parent + "server" + "backend_server"

BackendServer.add_user "demo", "demo"
run BackendServer