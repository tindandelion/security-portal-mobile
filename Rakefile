require "cucumber/rake/task"
require "pathname"

ENV['APP_URL'] = (Pathname.new(__FILE__).parent + "public" + "index.html").to_s

Cucumber::Rake::Task.new(:features)
