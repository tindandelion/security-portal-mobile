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
APP_DIR = PROJECT_DIR + "client"
APP_URL = "http://localhost:4567"
SPEC_DIR = PROJECT_DIR + "spec"

ENV['APP_URL'] = APP_URL
ENV['JASMINE_BROWSER'] = 'chrome'

desc "Compile CoffeeScript files"
task :compile do
  sh "coffee --compile #{APP_DIR}"
  sh "coffee --compile #{SPEC_DIR}"
end

desc "Run Sinatra server"
task :server do 
  start_server
end

desc "Run application"
task :app => :compile do
  open_browser
  start_server
end

Cucumber::Rake::Task.new(:features => :compile)

desc "Run unit specs"
task :spec => ["compile", "jasmine:ci"]

desc "Run all tests" 
task :test => [:spec, :features]

def open_browser
  require "watir-webdriver"
  browser = Watir::Browser.new(:chrome, :switches => ['--disable-web-security'])
  browser.goto APP_URL
end



def start_server
  require_relative "features/support/backend_server"
  BackendServer.run!
end  

