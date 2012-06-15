require "bundler/gem_tasks"
require "rake/testtask"

task :default => :test

Rake::TestTask.new do |t|
  t.libs << 'test'
end

# IRB
desc "Open an irb session preloaded with this library"
task :console do
  sh "irb -rubygems -r ./lib/quixote.rb"
end