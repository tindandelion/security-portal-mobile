require "rake/clean"
require "cucumber/rake/task"
require "pathname"

begin
  require 'jasmine'
  load 'jasmine/tasks/jasmine.rake'
rescue LoadError
  task :jasmine do
    abort "Jasmine is not available. In order to run jasmine, you must: (sudo) gem install jasmine"
  end
end

PROJECT_DIR = Pathname.new(__FILE__).parent
APP_DIR = PROJECT_DIR + "public"
SPEC_DIR = PROJECT_DIR + "spec"

ENV['APP_URL'] = "file://" + (APP_DIR + "index.html").to_s
ENV['JASMINE_BROWSER'] = 'chrome'

desc "Compile CoffeeScript files"
task :compile do
  sh "coffee --compile #{APP_DIR}"
  sh "coffee --compile #{SPEC_DIR}"
end

desc "Run Sinatra server"
task :server do 
  require_relative "features/support/backend_server"
  BackendServer.run!
end

Cucumber::Rake::Task.new(:features => :compile)

desc "Run all specs"
task :spec => ["compile", "jasmine:ci"]

