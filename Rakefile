require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

PLUGIN      = "acts_as_rateable_by_ip"
GEM         = "acts_as_rateable_by_ip"
GEM_VERSION = "0.0.1"
EMAIL       = "cavneb@gmail.com"
HOMEPAGE    = "http://www.teachmetocode.com"
SUMMARY     = "Plugin/gem that provides rating functionality"
DESCRIPTION = "Plugin/gem that provides rating functionality"
AUTHORS     = ["Eric Berry"]

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name        = PLUGIN
    gemspec.summary     = SUMMARY
    gemspec.description = DESCRIPTION
    gemspec.email       = EMAIL
    gemspec.homepage    = HOMEPAGE
    gemspec.authors     = AUTHORS
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end


desc 'Default: run unit tests.'
task :default => :test

desc 'Test the acts_as_rateable_by_ip plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the acts_as_rateable_by_ip plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'ActsAsRateableByIp'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
