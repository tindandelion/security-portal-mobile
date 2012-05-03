require "rake/clean"
require "cucumber/rake/task"
require "pathname"

PUBLIC_DIR = Pathname.new(__FILE__).parent + "public"
APP_DIR = PUBLIC_DIR + "app"
ENV['APP_URL'] = (PUBLIC_DIR + "index.html").to_s
CLEAN.include APP_DIR + "*.js"

desc "Compile CoffeeScript files"
task :compile do
  sh "coffee --compile #{APP_DIR}"
end

Cucumber::Rake::Task.new(:features => :compile)
