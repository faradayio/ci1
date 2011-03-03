$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "lib"))

require 'rubygems'
require 'bundler'
Bundler.setup

require "integrity"
require "integrity/notifier/campfire"

Integrity.configure do |c|
  c.database     = ENV["DATABASE_URL"] || 'sqlite3:integrity.db'
  c.directory    = "/tmp"
  c.base_url     = ENV['URL'] || 'http://tests.brighterplanet.com'
  c.log          = "/tmp/integrity.log"
  c.github_token = ENV["GITHUB_TOKEN"] || "TOKEN"
  c.build_all    = true
  c.builder      = :threaded, 5
  c.username     = ENV['HTTP_AUTH_USERNAME']
  c.password     = ENV['HTTP_AUTH_PASSWORD']
end
