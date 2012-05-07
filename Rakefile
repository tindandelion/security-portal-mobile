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

PUBLIC_DIR = Pathname.new(__FILE__).parent + "public"
APP_DIR = PUBLIC_DIR
ENV['APP_URL'] = "file://" + (PUBLIC_DIR + "index.html").to_s
CLEAN.include APP_DIR + "*.js"
ENV['JASMINE_BROWSER'] = 'chrome'

desc "Compile CoffeeScript files"
task :compile do
  sh "coffee --compile #{APP_DIR}"
end

Cucumber::Rake::Task.new(:features => :compile)

