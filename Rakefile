require "rake/testtask"
require "rake/clean"

task :env do
  $:.push File.dirname(__FILE__)
  require "init"
end

task :run => :env do
  `bundle exec rackup`
end

desc "Default: run all tests"
task :default => :test

desc "Run tests"
task :test => %w[test:unit test:acceptance]
namespace :test => :env do
  desc "Run unit tests"
  Rake::TestTask.new(:unit) do |t|
    t.libs << "test"
    t.test_files = FileList["test/unit/*_test.rb"]
  end

  desc "Run acceptance tests"
  Rake::TestTask.new(:acceptance) do |t|
    t.libs << "test"
    t.test_files = FileList["test/acceptance/*_test.rb"]
  end
end

desc "Create the database"
task :db => :env do
  DataMapper.auto_upgrade!
end

desc "Clean-up build directory"
task :cleanup => :env do
  Integrity::Build.all(:completed_at.not => nil).each { |build|
    dir = Integrity.directory.join(build.id.to_s)
    dir.rmtree if dir.directory?
  }
end

namespace :jobs do
  desc "Clear the delayed_job queue."
  task :clear => :env do
    require "integrity/builder/delayed"
    Delayed::Job.delete_all
  end

  desc "Start a delayed_job worker."
  task :work => :env do
    require "integrity/builder/delayed"
    Delayed::Worker.new.start
  end
end

begin
  namespace :resque do
    require "resque/tasks"

    desc "Start a Resque worker for Integrity"
    task :work => :env do
      ENV["QUEUE"] = "integrity"
      Rake::Task["resque:resque:work"].invoke
    end
  end
rescue LoadError
end

desc "Generate HTML documentation."
file "doc/integrity.html" => ["doc/htmlize",
  "doc/integrity.txt",
  "doc/integrity.css"] do |f|
  sh "cat doc/integrity.txt | doc/htmlize > #{f.name}"
end

desc "Re-generate stylesheet"
file "public/integrity.css" => "views/integrity.sass" do |f|
  sh "sass views/integrity.sass > #{f.name}"
end

CLOBBER.include("doc/integrity.html")
