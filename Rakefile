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
APP_PORT = 9393
SPEC_DIR = PROJECT_DIR + "spec"

ENV['APP_URL'] = APP_URL
ENV['JASMINE_BROWSER'] = 'chrome'

CLEAN.include (SPEC_DIR + "**/*.js").to_s

namespace 'compile' do 
  task 'app' do
    sh "coffee --compile #{APP_DIR}"
  end
  
  task 'spec' do 
    sh "coffee --compile #{SPEC_DIR}"
  end
  
  task 'css' do 
    sh "compass compile #{APP_DIR + 'styles'}"
  end
end  

desc "Run Sinatra server"
task :server do 
  start_server
end

desc "Run application"
task 'app' do
  open_browser
  start_server
end

namespace 'features' do 
  Cucumber::Rake::Task.new('all')
  Cucumber::Rake::Task.new('wip') do |t|
    t.cucumber_opts = ['--tags', '@wip']
  end
end

task 'features' => 'features:all'

desc 'Run unit specs'
task 'spec' => ['jasmine:ci']

desc 'Run all tests'
task 'test' => ['spec', 'features']

def open_browser
  require "watir-webdriver"
  browser = Watir::Browser.new(:chrome, :switches => ['--disable-web-security'])
  browser.goto "http://localhost:#{APP_PORT}"
end

def start_server
  sh "rackup -p #{APP_PORT}"
end  

